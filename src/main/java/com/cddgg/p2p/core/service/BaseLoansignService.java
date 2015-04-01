package com.cddgg.p2p.core.service;

import java.io.Serializable;
import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.cddgg.base.model.PageModel;
import com.cddgg.base.spring.orm.hibernate.impl.HibernateSupport;
import com.cddgg.base.util.SMSText;
import com.cddgg.base.util.SendBackMsgThead;
import com.cddgg.base.util.SendMsgThead;
import com.cddgg.base.util.StringUtil;
import com.cddgg.commons.date.DateUtils;
import com.cddgg.commons.log.LOG;
import com.cddgg.p2p.core.entity.CalculateLoan;
import com.cddgg.p2p.core.loanquery.LoanSignQuery;
import com.cddgg.p2p.core.loansignfund.LoanSignFund;
import com.cddgg.p2p.core.userinfo.UserInfoQuery;
import com.cddgg.p2p.huitou.admin.spring.service.AutomaticService;
import com.cddgg.p2p.huitou.admin.spring.service.IntegralService;
import com.cddgg.p2p.huitou.admin.spring.service.MessagesettingService;
import com.cddgg.p2p.huitou.constant.Constant;
import com.cddgg.p2p.huitou.entity.BorrowersApply;
import com.cddgg.p2p.huitou.entity.Costratio;
import com.cddgg.p2p.huitou.entity.Loanrecord;
import com.cddgg.p2p.huitou.entity.Loansign;
import com.cddgg.p2p.huitou.entity.Loansignbasics;
import com.cddgg.p2p.huitou.entity.Repaymentrecord;
import com.cddgg.p2p.huitou.entity.Userbasicsinfo;
import com.cddgg.p2p.huitou.entity.Userrelationinfo;
import com.cddgg.p2p.huitou.util.Arith;

/**
 * 借款标通用service
 * 
 * @author longyang
 * 
 */
@Service
@Transactional
public class BaseLoansignService {

	/** log */
	LOG log = new LOG();

	/** dao */
	@Resource
	private HibernateSupport dao;

	/** messagesettingService */
	@Resource
	private MessagesettingService messagesettingService;
	/** loanSignQuery */
	@Resource
	private LoanSignQuery loanSignQuery;
	/** loanSignFund */
	@Autowired
	private LoanSignFund loanSignFund;
	/** integralservice */
	@Resource
	private IntegralService integralservice;

	/** automaticService */
	@Resource
	private AutomaticService automaticService;

	@Resource
	private UserInfoQuery userInfoQuery;

	/**
	 * <p>
	 * Title: getLoansignCount
	 * </p>
	 * <p>
	 * Description: 根据类型查询借款标的条数
	 * </p>
	 * 
	 * @param type
	 *            类型
	 * @return 条数
	 */
	public int getLoansignCount(int type) {
		StringBuffer sb = new StringBuffer(
				"SELECT COUNT(1) FROM loansign where loanType=");
		return loanSignQuery.queryCount(sb.append(type).toString());
	}

	/**
	 * <p>
	 * Title: findExpirLoanSign
	 * </p>
	 * <p>
	 * Description: 通过借款标类型查询到即将到期的借款标
	 * </p>
	 * 
	 * @param page
	 *            分页
	 * @param loanType
	 *            借款标类型
	 * @return 集合
	 */
	public List<Object> findExpirLoanSign(PageModel page, int loanType) {

		StringBuffer sb = new StringBuffer(
				"SELECT loansign.id, loansignbasics.loanNumber, loansignbasics.loanTitle, ");
		sb.append(" userbasicsinfo. NAME, loansign.loanUnit, loansign.issueLoan, loansign.`month`, ");
//		sb.append(" CASE WHEN loansignbasics.loanCategory = 1 THEN '信用标' ELSE '抵押标' END, ");
		sb.append(" loansignbasics.mgtMoney, loansign.publishTime, loansign.rate, loansignbasics.reward,");
		sb.append(" CASE WHEN loansign.refundWay = 1 THEN '按月等额本息' WHEN loansign.refundWay = 2 THEN '按月付息到期还本' ELSE '到期一次性还本息' END,");
		sb.append(" CASE WHEN loansign.loanstate = 1 THEN '未发布' WHEN loansign.loanstate = 2 THEN '进行中' WHEN loansign.loanstate = 3 THEN '回款中' ELSE '已完成' END, ");
		sb.append(" CASE WHEN loansign.loanstate = 3 OR loansign.loanstate = 4 THEN '已放款' ELSE '未还款' END, ");
		sb.append(" loansignbasics.creditTime, CASE WHEN loansign.isShow = 1 THEN '显示' ELSE '不显示' END, CASE WHEN loansign.isRecommand = 1 THEN '推荐' ELSE '不推荐' END");
		sb.append(" FROM loansign INNER JOIN loansignbasics ON loansign.id = loansignbasics.id ");
		sb.append(" INNER JOIN userbasicsinfo ON loansign.userbasicinfo_id = userbasicsinfo.id WHERE loansign.loanType = ? AND loansign.id IN ");
		sb.append(" ( SELECT loanSign_id FROM repaymentrecord WHERE to_days(preRepayDate)");
		sb.append(" - to_days(now()) <= 7 AND to_days(preRepayDate) >= to_days(now()))");
		System.out.println(sb);
		List<Object> param = new ArrayList<Object>();
		param.add(loanType);
		Object[] params = null;
		if (param.size() > 0) {
			params = param.toArray();
		}
		if (page != null) {
			return (List<Object>) dao.pageListBySql(page, sb.toString(), null,
					params);
		} else {
			return dao.findBySql(sb.toString(), params);
		}
	}

	/**
	 * 检查该借款的授信额度，判断是否可以购买
	 * 
	 * @param loan
	 *            借款标
	 * @return true 可以购买 false 不可以
	 */
	public boolean checkCredit(Loansign loan) {
		StringBuffer sb = new StringBuffer(
				"SELECT ( SELECT IFNULL(sum(issueLoan), 0) FROM loansign WHERE loansign.loanstate != 4 AND loansign.userbasicinfo_id = userfundinfo.id ) +")
				.append(loan.getIssueLoan())
				.append("- IFNULL(credit, 0) FROM userfundinfo WHERE userfundinfo.id =")
				.append(loan.getUserbasicsinfo().getId());
		System.out.println(sb.toString());
		Object object = dao.findObjectBySql(sb.toString());
		if (null != object && Double.valueOf(object.toString()) < 0) {
			return true;
		} else {
			return false;
		}
	}

	/**
	 * <p>
	 * Title: changeEnd
	 * </p>
	 * <p>
	 * Description: 如果该标的还款记录中还款状态均不为1，该标状态变为已完成
	 * </p>
	 * 
	 * @param repaymentrecord
	 *            还款记录
	 */
	private void changeEnd(Repaymentrecord repaymentrecord) {
		StringBuffer sb = new StringBuffer(
				"SELECT COUNT(1) from repaymentrecord where repayState=1 and loanSign_id=")
				.append(repaymentrecord.getLoansign().getId())
				.append(" and id!=").append(repaymentrecord.getId());
		Object obj = dao.findObjectBySql(sb.toString());

		if (null != obj && Integer.parseInt(obj.toString()) == 0) {
			Loansign loanSign = repaymentrecord.getLoansign();
			loanSign.setLoanstate(4);// 4已完成
			dao.update(loanSign);
		}
	}

	/**
	 * 通过传入的还款计划进行回款给用户(针对所有的标)
	 * 
	 * @param repaymentRecord
	 *            还款记录
	 * @param reallyDay
	 *            天标和一次性还款的使用天数 其他就传0
	 */
	private void repay(Repaymentrecord repaymentRecord, Integer reallyDay) {
		// 1.找到该借款标的所有认购人
		StringBuffer sb = new StringBuffer("From Loanrecord where isSucceed=1 and loansign.id=")
				.append(repaymentRecord.getLoansign().getId());
		List<Loanrecord> loanreList = dao.find(sb.toString());
		BigDecimal interest = new BigDecimal(0.00);
		BigDecimal money = new BigDecimal(0.00);
		for (Loanrecord loanrecord : loanreList) {
			if (repaymentRecord.getLoansign().getLoanType() == Constant.STATUES_FOUR) {
				// 计算流转标这一阶段的使用时间
				reallyDay = loanSignFund.reallyDay(loanrecord.getTenderTime(),
						repaymentRecord.getPreRepayDate());
			}
			// 1.查询到用户的收款金额
			money = loanSignQuery.queryMoney(repaymentRecord,
					loanrecord.getTenderMoney(), repaymentRecord.getLoansign(),
					reallyDay);

			// 2.改变用户资金明细账和可用余额
			loanSignFund.updateMoney(money, Long.valueOf("4"), DateUtils
					.format(Constant.DEFAULT_TIME_FORMAT), loanrecord
					.getUserbasicsinfo().getId(), "借款标回款", null,
					repaymentRecord.getLoansign().getId());

			// 3.改变平台资金明细账和平台的余额
			loanSignFund.updatePlatformMoney(
					money.multiply(new BigDecimal(-1)), Long.valueOf("4"),
					DateUtils.format(Constant.DEFAULT_TIME_FORMAT), "借款标回款",
					null);

			// 4.求到用户本次所赚得利息interest
			interest = loanSignQuery.queryInterest(repaymentRecord,
					loanrecord.getTenderMoney(), repaymentRecord.getLoansign(),
					reallyDay);

			// 5.求到该用户要支付的管理费
			money = loanSignFund.managementCost(interest,
					repaymentRecord.getLoansign(),
					loanrecord.getIsPrivilege());

			// 6.改变用户资金明细账和可用余额
			loanSignFund.updateMoney(money.multiply(new BigDecimal(-1)), Long
					.valueOf("13"), DateUtils
					.format(Constant.DEFAULT_TIME_FORMAT), loanrecord
					.getUserbasicsinfo().getId(), "管理费", null, repaymentRecord
					.getLoansign().getId());

			// 7.改变平台资金明细账和平台的余额
			loanSignFund.updatePlatformMoney(money, Long.valueOf("13"),
					DateUtils.format(Constant.DEFAULT_TIME_FORMAT), "投资管理费",
					null);

			// 8.推广的信息---

		}
	}

	/**
	 * <p>
	 * Title: dayOnTimeRepay
	 * </p>
	 * <p>
	 * Description: 天标还款（按照实际的天数进行计算）
	 * </p>
	 * 
	 * @param repaymentRecord
	 *            还款记录
	 * @param repayTime
	 *            还款时间
	 * @return 是否
	 */
	public boolean dayOnTimeRepay(Repaymentrecord repaymentRecord,
			String repayTime) {
		// try {
		Loansign loansign = repaymentRecord.getLoansign();
		// 实际使用天数
		int useDay = loanSignFund.reallyUseDay(
				loanSignQuery.getcreditTime(loansign.getId()), repayTime);
		// 实际还款的利息
		BigDecimal reallyInterest = loanSignFund.instalmentInterest(
				new BigDecimal(loansign.getIssueLoan()), loansign.getRate(),
				useDay, 2);

		repaymentRecord.setRepayTime(repayTime);// 实际还款时间=用户选择的时间
		// 1.资金操作
		repay(repaymentRecord, useDay);
		// 2.给投资者发送消息，告知已经回款(系统消息,邮件)
		String contant = new SMSText().backContant;
		Thread sendBackMsgThead = new SendBackMsgThead(loansign, contant,
				messagesettingService);
		sendBackMsgThead.start();

		// 3.计算写入时间的使用天数并把标改为已完成
		loansign.setRealDay(useDay);
		loansign.setLoanstate(4);
		dao.update(loansign);
		// 4.改还款记录状态和记录实际还款金额
		repaymentRecord.setRealMoney(reallyInterest.doubleValue());// 实际还款利息
		repaymentRecord.setRepayState(useDay > loansign.getUseDay() ? 4
				: (useDay == loansign.getUseDay() ? 2 : 5));
		dao.update(repaymentRecord);
		// 5.检查是否完成
		changeEnd(repaymentRecord);
		// 6.借款人的积分变化(照按时算)
		integralservice.timelyRepaymentIntegral(repaymentRecord,
				new BigDecimal(repaymentRecord.getRealMoney())
						.add(new BigDecimal(repaymentRecord.getMoney())));
		return true;
		// } catch (Exception e) {
		// log.error("BaseLoansignService-按时还款资金操作时出现异常！");
		// e.printStackTrace();
		// return false;
		// }
	}

	/**
	 * 秒标还款(实际的和预计的一样)
	 * 
	 * @param loansign
	 *            借款标
	 * @return 是否成功
	 */
	public boolean secOnTimeRepay(Loansign loansign) {
		// 1.资金操作
		Repaymentrecord repayment = loanSignQuery.getRepaymentByLSId(loansign
				.getId().toString());
		repay(repayment, 0);

		// 2.给投资者发送消息，告知已经回款(系统消息,邮件,短信都会发送)
		String contant = new SMSText().backContant;
		Thread sendBackMsgThead = new SendBackMsgThead(loansign, contant,
				messagesettingService);
		sendBackMsgThead.start();

		// 3.改状态loansign
		loansign.setLoanstate(4);// 已经完成
		dao.update(loansign);

		// 4.改状态记录实际还款金额。回款计划表
		repayment.setRepayState(2);
		repayment.setRepayTime(DateUtils.format(Constant.DEFAULT_DATE_FORMAT));
		repayment.setRealMoney(repayment.getPreRepayMoney());// 实际还款金额==预计还款
		dao.update(repayment);
		return true;
	}

	/**
	 * <p>
	 * Title: onTimeRepay
	 * </p>
	 * <p>
	 * Description: 按时还款(普通标和流转标)
	 * </p>
	 * 
	 * @param repaymentRecord
	 *            还款记录
	 * @param repayTime
	 *            还款时间
	 * @return 是否成功
	 */
	public boolean onTimeRepay(Repaymentrecord repaymentRecord, String repayTime) {
		// 1.资金操作
		repaymentRecord.setRepayState(2);// 按时还款

		repay(repaymentRecord, 0);

		// 2.给投资者发送消息，告知已经回款(系统消息,邮件,短信都会发送)
		String contant = new SMSText().backContant;
		Thread sendBackMsgThead = new SendBackMsgThead(
				repaymentRecord.getLoansign(), contant, messagesettingService);
		sendBackMsgThead.start();
		// 3.改状态
		repaymentRecord.setRepayTime(repayTime);// 实际还款时间--用户选择的时间
		repaymentRecord.setRealMoney(repaymentRecord.getPreRepayMoney());// 实际的和预计的一样
		dao.update(repaymentRecord);
		// 4.判断该借款标是否已经全部还款-->如果是就把该标变成已完成
		changeEnd(repaymentRecord);
		// 5.借款人的积分变化
		integralservice.timelyRepaymentIntegral(repaymentRecord,
				new BigDecimal(repaymentRecord.getPreRepayMoney())
						.add(new BigDecimal(repaymentRecord.getMoney())));
		return true;
	}

	/**
	 * <p>
	 * Title: exceedTimeRepay
	 * </p>
	 * <p>
	 * Description: 逾期还款
	 * </p>
	 * 
	 * @param repaymentRecord
	 *            还款记录
	 * @return 是否成功
	 */
	public boolean exceedTimeRepay(Repaymentrecord repaymentRecord) {

		// 1.资金操作
		repaymentRecord.setRepayState(3);// 逾期未还款
		repay(repaymentRecord, 0);
		// 2.给投资者发送消息，告知已经回款(系统消息,邮件,短信都会发送)
		String contant = new SMSText().backContant;
		Thread sendBackMsgThead = new SendBackMsgThead(
				repaymentRecord.getLoansign(), contant, messagesettingService);
		sendBackMsgThead.start();

		// 3.改状态
		dao.update(repaymentRecord);

		// 4.判断该借款标是否已经全部还款-->如果是就把该标变成已完成
		changeEnd(repaymentRecord);

		// 5.借款人的积分变化
		integralservice.overdueRepaymentIntegral(repaymentRecord,
				new BigDecimal(repaymentRecord.getPreRepayMoney())
						.add(new BigDecimal(repaymentRecord.getMoney())));
		return true;
	}

	/**
	 * <p>
	 * Title: advanceRepay
	 * </p>
	 * <p>
	 * Description: 提前还款(普通)
	 * </p>
	 * 
	 * @param repaymentRecord
	 *            还款记录
	 * @param repayTime
	 *            还款时间
	 * @return 是否成功
	 */
	public boolean advanceRepay(Repaymentrecord repaymentRecord,
			String repayTime) {

		Loansign loansign = dao.get(Loansign.class, repaymentRecord
				.getLoansign().getId());
		// 1.资金操作

		// 实际使用天数
		int reallyDay = loanSignFund.reallyUseDay(
				loanSignQuery.getcreditTime(loansign.getId()), repayTime);
		repay(repaymentRecord, reallyDay);

		// 2.给投资者发送消息，告知已经回款(系统消息,邮件,短信都会发送)
		String contant = new SMSText().backContant;
		Thread sendBackMsgThead = new SendBackMsgThead(loansign, contant,
				messagesettingService);
		sendBackMsgThead.start();

		// 3.改loansign 的实际使用天数
		loansign.setRealDay(reallyDay);
		dao.update(loansign);

		// 4.改状态
		repaymentRecord.setRepayState(5);// 提前还款
		repaymentRecord.setRepayTime(repayTime);
		// 记录实际还款金额
		repaymentRecord.setRealMoney(loanSignFund.advanceInterest(
				new BigDecimal(loansign.getIssueLoan()), loansign.getRate(),
				reallyDay, loansign.getLoanType()).doubleValue());
		dao.update(repaymentRecord);

		// 4.判断该借款标是否已经全部还款-->如果是就把该标变成已完成
		changeEnd(repaymentRecord);

		// 5.借款人的积分变化(按时、普通标 、天标、流转标有)--
		integralservice.timelyRepaymentIntegral(repaymentRecord,
				new BigDecimal(repaymentRecord.getRealMoney())
						.add(new BigDecimal(repaymentRecord.getMoney())));
		return true;
	}

	/**
	 * <p>
	 * Title: save
	 * </p>
	 * <p>
	 * Description: 保存借款标(普通标，天标，秒标)
	 * </p>
	 * 
	 * @param loansign
	 *            借款标
	 * @param loansignbasics
	 *            借款标基础信息
	 * @param costratio
	 *            费用比例
	 * @return 是否
	 */
	public boolean save(Loansign loansign, Loansignbasics loansignbasics,
			Costratio costratio) {
		// 1.保存loansign
		loansign.setLoanstate(1);// 未发布
		BorrowersApply boor = loansign.getBorrowersApply();
		// 设置当前的费用比例
		if (costratio != null) {
			loansign.setMfeeratio(costratio.getMfeeratio());
			loansign.setPmfeeratio(costratio.getPmfeeratio());
			loansign.setPrepaymentRate(costratio.getPrepaymentRate());
			loansign.setOverdueRepayment(costratio.getOverdueRepayment());
			if(loansign.getLoanType()==1){
				if(loansign.getMonth()<=2){
					loansign.setOther(costratio.getWithinTwoMonths());
				}else{
					loansign.setOther(costratio.getWithinTwoMonths());
					loansign.setOthers(costratio.getOther());
				}
				//修改该申请金额是否发布了借款标
//				boor = userInfoQuery.getBorrowersApply(Integer.parseInt(loansign.getLoansignType().getId().toString()));
//				loansign.setBorrowersApply(boor);
//				String sql = "UPDATE borrowers_apply b SET b.state =1 WHERE b.id = ?";
//				dao.executeSql(sql,boor.getId());
				boor.setState(1);
				dao.update(boor);
			}else if(loansign.getLoanType()==2){
				loansign.setOther(costratio.getDayRate());
			}else{
				loansign.setOther(Double.parseDouble(Constant.STATUES_ZERO.toString()));
			}
//			loansign.setOther(costratio.getOther());
			loansign.setHighLines(costratio.getHighLines());
		}
		Serializable seria = dao.save(loansign);
		loansign.setId(Long.valueOf(seria.toString()));

		// 2.保存Loansignbasics
		loansignbasics.setLoanSignTime(DateUtils
				.format(Constant.DEFAULT_TIME_FORMAT));// 创建时间
		boolean bool = userInfoQuery.isPrivilege(loansign.getUserbasicsinfo());
		int isPrivilege = Constant.STATUES_ZERO;
		if (bool) {
			isPrivilege = Constant.STATUES_ONE;
		}
//		// 普通标和流转标才有管理费
//		double managementFee = 0.00;
//		if (loansign.getLoanType().equals(Constant.STATUES_ONE)) {
//			managementFee = loanSignFund.managementFee(
//					new BigDecimal(loansign.getIssueLoan()), loansign,
//					isPrivilege)
//					.doubleValue();
//		}else if(loansign.getLoanType().equals(Constant.STATUES_TWO)){
//			managementFee = loanSignFund.managementFee(
//					new BigDecimal(loansign.getIssueLoan()), loansign,
//					isPrivilege)
//					.doubleValue();
//		}
		loansignbasics.setMgtMoney(0.00);// 借款管理费
		loansignbasics.setLoansign(loansign);
	    loansignbasics.setpBidNo("BH"+StringUtil.pMerBillNo());
	    loansignbasics.setpContractNo("HT"+StringUtil.pMerBillNo());
		dao.save(loansignbasics);
		if(loansign.getLoanType()==1){
			if(loansign.getLoansignType().getId()==4){
				Userbasicsinfo user = loansign.getUserbasicsinfo();
				user.setIsLoanState(1);
				dao.update(user);
			}
		}
		return true;
	}

	/**
	 * 修改借款标（普通标，天标，秒标，流转标）
	 * 
	 * @param loansign
	 *            借款标
	 * @param loansignbasics
	 *            借款标基础信息
	 * @return 是否成功
	 */
	public boolean update(Loansign loansign, Loansignbasics loansignbasics,Costratio costratio) {
		// 1.修改loansign
		Loansign loansignOld = loanSignQuery.getLoansignById(loansign.getId()
				.toString());
		Loansignbasics loansignbasicsOld = loanSignQuery
				.getLoansignbasicsById(loansign.getId().toString());
		boolean bool = userInfoQuery.isPrivilege(loansignOld.getUserbasicsinfo());
		int isPrivilege = Constant.STATUES_ZERO;
		if (bool) {
			isPrivilege = Constant.STATUES_ONE;
		}
		if (loansignOld.getLoanstate() == 1) {// 未发布的才可以修改
			
			loansignOld.setIssueLoan(loansign.getIssueLoan());
			loansignbasicsOld.setLoanTitle(loansignbasics.getLoanTitle());
			loansignbasicsOld.setLoanNumber(loansignbasics.getLoanNumber());
			loansignOld.setRate(loansign.getRate());
			loansignbasicsOld.setReward(loansignbasics.getReward());
			loansignbasicsOld.setUnassureWay(loansignbasics.getUnassureWay());
			loansignbasicsOld.setAssure(loansignbasics.getAssure());
			loansignOld.setRefundWay(loansign.getRefundWay());
			loansignOld.setLoanUnit(loansign.getLoanUnit());
			loansignOld.setMonth(loansign.getMonth());
			loansignOld.setUseDay(loansign.getUseDay());
			loansignOld.setIsShow(loansign.getIsShow());
			loansignOld.setIsRecommand(loansign.getIsRecommand());
			loansignbasicsOld.setBehoof(loansignbasics.getBehoof());
			loansignbasicsOld.setLoanOrigin(loansignbasics.getLoanOrigin());
			loansignbasicsOld.setOverview(loansignbasics.getOverview());
			
			loansignbasicsOld.setRiskCtrlWay(loansignbasics.getRiskCtrlWay());
			loansignbasicsOld.setSpeech(loansignbasics.getSpeech());
			loansignbasicsOld.setRiskAssess(loansignbasics.getRiskAssess());
			loansignbasicsOld.setLoanExplain(loansignbasics.getLoanExplain());
		}else{
			loansignOld.setIsShow(loansign.getIsShow());
			loansignOld.setIsRecommand(loansign.getIsRecommand());
		}
		dao.update(loansignOld);
		dao.update(loansignbasicsOld);
		return true;
	}

	/**
	 * <p>
	 * Title: deleteAll
	 * </p>
	 * <p>
	 * Description: 删除多个未发布的借款标
	 * </p>
	 * 
	 * @param ids
	 *            ids编号集合
	 * @return 结果
	 */
	public int deleteAll(String ids) {
		String[] sid = ids.split(",");
		for (String id : sid) {
			if (deleteone(id) != 1) {// false==删除失败
				return 2;
			}
		}
		return 1;
	}

	/**
	 * <p>
	 * Title: deleteone
	 * </p>
	 * <p>
	 * Description: 删除一个未发布的借款标
	 * </p>
	 * 
	 * @param id
	 *            id
	 * @return 结果
	 */
	public int deleteone(String id) {
		StringBuffer sb = new StringBuffer(
				"From Loansignbasics where loansign.id=").append(id);
		List<Loansignbasics> loansbList = dao.find(sb.toString());
		Loansignbasics loansignbasics = loansbList.size() == 1 ? loansbList
				.get(0) : null;
		if (loansignbasics.getLoansign().getLoanstate() != 1) {// 未发布
			return 2;
		}
		// 1.删除Loansignbasics
		dao.delete(loansignbasics);
		// 2.删除Loansign
		dao.delete(loansignbasics.getLoansign());
		return 1;
	}

	/**
	 * <p>
	 * Title: queryBorrowersbasecount
	 * </p>
	 * <p>
	 * Description: 查询到所有的借款人条数
	 * </p>
	 * 
	 * @param username
	 *            借款人用户名
	 * @param cardno
	 *            身份证号码
	 * @return 对象
	 */
	public Object queryBorrowersbasecount(String username, String cardno) {
		StringBuffer sb = new StringBuffer(
				"SELECT COUNT(1) from userbasicsinfo,userrelationinfo where userbasicsinfo.id=userrelationinfo.user_id");
		sb.append(" and userbasicsinfo.id in(SELECT userbasicinfo_id from borrowersbase where auditResult=1) ");
		if (!username.trim().equals("")) {
			sb.append(" and userbasicsinfo.name like '%").append(username)
					.append("%'");
		}
		if (!cardno.equals("")) {
			sb.append(" and userrelationinfo.cardId like '%").append(username)
					.append("%'");
		}
		return dao.findObjectBySql(sb.toString());

	}
	/**
	 * <p>
	 * Title: queryBorrowersbasecount
	 * </p>
	 * <p>
	 * Description: 查询到所有的借款人条数(针对普通标，查询申请的借款金额)
	 * </p>
	 * 
	 * @param username
	 *            借款人用户名
	 * @param cardno
	 *            身份证号码
	 * @return 对象
	 */
	public Object queryBorrowersbasecounts(String username, String cardno) {
		StringBuffer sb = new StringBuffer("SELECT count(u.id) FROM borrowers_apply b, borrowersbase s, userbasicsinfo u, userrelationinfo f WHERE b.base_id = s.id AND s.userbasicinfo_id = u.id AND u.id = f.id AND b.`status` = 1 AND b.state = 0");
		if (!username.trim().equals("")) {
			sb.append(" and u.name like '%").append(username)
					.append("%'");
		}
		if (!cardno.equals("")) {
			sb.append(" and f.cardId like '%").append(cardno)
					.append("%'");
		}
		return dao.findObjectBySql(sb.toString());

	}
	/**
	 * <p>
	 * Title: queryBorrowersbaseList
	 * </p>
	 * <p>
	 * Description: 查询到所有的借款人
	 * </p>
	 * 
	 * @param page
	 *            page
	 * @param username
	 *            借款人用户名
	 * @param cardno
	 *            身份证号码
	 * @return 借款
	 */
	public Object queryBorrowersbaseList(PageModel page, String username,
			String cardno) {
		StringBuffer sb = new StringBuffer(
				"SELECT userbasicsinfo.id, userbasicsinfo. NAME, userbasicsinfo.userName, userrelationinfo.cardId  ");
		sb.append(" FROM userbasicsinfo, userrelationinfo WHERE userbasicsinfo.id = userrelationinfo.user_id ");
		sb.append(" AND userbasicsinfo.id IN ( SELECT userbasicinfo_id FROM borrowersbase WHERE auditResult = 1 )");
		if (!username.trim().equals("")) {
			sb.append(" and userbasicsinfo.name like '%").append(username)
					.append("%'");
		}
		if (!cardno.equals("")) {
			sb.append(" and userrelationinfo.cardId like '%").append(username)
					.append("%'");
		}

		return dao.findBySql(sb.toString(), null);

	}
	/**
	 * <p>
	 * Title: queryBorrowersbaseList
	 * </p>
	 * <p>
	 * Description: 查询到所有的借款人
	 * </p>
	 * 
	 * @param page
	 *            page
	 * @param username
	 *            借款人用户名
	 * @param cardno
	 *            身份证号码
	 * @return 借款
	 */
	public Object queryBorrowersbaseLists(PageModel page, String username,
			String cardno) {
		StringBuffer sb = new StringBuffer("SELECT b.id,u.name, u.userName, f.cardId FROM borrowers_apply b, borrowersbase s, userbasicsinfo u, userrelationinfo f WHERE b.base_id = s.id AND s.userbasicinfo_id = u.id AND u.id = f.id AND b.`status` = 1 AND b.state = 0");
		if (!username.trim().equals("")) {
			sb.append(" and u.name like '%").append(username)
					.append("%'");
		}
		if (!cardno.equals("")) {
			sb.append(" and f.cardId like '%").append(cardno)
					.append("%'");
		}
		sb.append(" LIMIT ").append(page.firstResult()).append(",")
				.append(page.getNumPerPage());
		return dao.findBySql(sb.toString(), null);

	}
	/**
	 * <p>
	 * Title: publish
	 * </p>
	 * <p>
	 * Description: 借款标发布(普通标，天标,秒标)
	 * </p>
	 * 
	 * @param loansign
	 *            借款标
	 * @return 是否成功
	 */
	public boolean publish(Loansign loansign) {
		// 3.改状态
		loansign.setLoanstate(2);// 2进行中
		String publishTime = DateUtils.format(Constant.DEFAULT_TIME_FORMAT);
		loansign.setPublishTime(publishTime);// 发布时间
		dao.update(loansign);

//		if (loansign.getLoanType() == 1) {// 普通标
//			// 1.自动投标
//			automaticService.automaticRelease(loansign);
//		}

		// 2.发送消息(通过用户设定的邮件反馈消息来进行发送消息)
		Loansignbasics loansignbasics = loanSignQuery
				.getLoansignbasicsById(loansign.getId().toString());
		List<Userrelationinfo> list = dao.find("from Userrelationinfo");
		String contant = new SMSText().publishContant.replace("#1#",
				loansignbasics.getLoanTitle());
		Thread sendMsgThread = new SendMsgThead(list, contant,
				messagesettingService);
		sendMsgThread.start();
		return true;
	}

	/**
	 * <p>
	 * Title: getReward
	 * </p>
	 * <p>
	 * Description: 对这款标认购人发放奖励
	 * </p>
	 * 
	 * @param loan
	 *            借款标
	 */
	public void getReward(Loansign loan) {
		StringBuffer sb = new StringBuffer(
				"SELECT DISTINCT loanrecord.userbasicinfo_id,sum(tenderMoney) from loanrecord WHERE loanrecord.isSucceed=1 and loanrecord.loanSign_id=")
				.append(loan.getId()).append(
						"  GROUP BY loanrecord.userbasicinfo_id");
		List<Object> objList = (List<Object>) dao
				.findBySql(sb.toString(), null);
		Object[] object = null;
		BigDecimal money = new BigDecimal(0.00);
		for (Object obj : objList) {
			object = (Object[]) obj;
			if (object[1] != null) {
				money = new BigDecimal(loan.getRate()).multiply(new BigDecimal(
						object[1].toString()));
				loanSignFund.updateMoney(money, Long.valueOf(9 + ""),
						DateUtils.format(Constant.DEFAULT_TIME_FORMAT),
						Long.valueOf(object[0].toString()), "投标奖励", null,
						loan.getId());
				loanSignFund.updatePlatformMoney(money, Long.valueOf("9"),
						DateUtils.format(Constant.DEFAULT_TIME_FORMAT), "奖励扣费",
						null);
			}
		}
	}

	/**
	 * <p>
	 * Title: credit
	 * </p>
	 * <p>
	 * Description: 借款标放款(普通标和天标、流转标)
	 * </p>
	 * 
	 * @param loansign
	 *            借款标
	 * @return 是否成功
	 */
	public boolean credit(Loansign loansign) {
		try {

			// 1.生成还款记录
			this.repaymentRecords(loansign);

			// 2.平台资金减少
			loanSignFund.updatePlatformMoney(
					new BigDecimal(loansign.getIssueLoan()),
					Long.valueOf(14 + ""),
					DateUtils.format(Constant.DEFAULT_TIME_FORMAT), "借款标放款",
					null);// 14.放款相关

			// 3.改状态
			if (loansign.getLoanType() != 4) {
				loansign.setLoanstate(3);// 回款中
				dao.update(loansign);
			}

			// 4.改还款时间
			Loansignbasics loansignbasics = loanSignQuery
					.getLoansignbasicsById(loansign.getId().toString());
			loansignbasics.setCreditTime(DateUtils
					.format(Constant.DEFAULT_TIME_FORMAT));// 放款时间
			dao.update(loansignbasics);
			// 4.放款发放奖励(天标和普通标有奖励)
			if (loansign.getLoanType() == 1 || loansign.getLoanType() == 2) {
				getReward(loansign);
			}
			return true;
		} catch (ParseException e) {
			log.error("BaseLoansignService-借款标放款出错！");
			return false;
		}
	}
	/**
	 * <p>
	 * Title: GetQueryConditions
	 * </p>
	 * <p>
	 * Description: 组装的查询条件
	 * </p>
	 * 
	 * @param loansignbasics
	 *            借款标基础信息
	 * @return sql语句
	 */
	public String getQueryConditions(Loansignbasics loansignbasics,String loanType) {
		StringBuffer sb = new StringBuffer();
		if (null != loansignbasics.getLoanTitle()
				&& !"".equals(loansignbasics.getLoanTitle())) {
			sb.append(" and loansignbasics.loanTitle like '%")
					.append(loansignbasics.getLoanTitle()).append("%'");
		}
		if (null != loansignbasics.getLoanNumber()
				&& !"".equals(loansignbasics.getLoanNumber())) {
			sb.append(" and loansignbasics.loanNumber like '%")
					.append(loansignbasics.getLoanNumber()).append("%'");
		}
		if (null != loansignbasics.getUnassureWay()
				&& !"".equals(loansignbasics.getUnassureWay())) {
			sb.append(" and userbasicsinfo.name like '%")
					.append(loansignbasics.getUnassureWay()).append("%'");
		}
		if (null != loansignbasics.getRiskAssess()) {
			sb.append(" and loansign.loanstate=").append(
					loansignbasics.getRiskAssess());
		}
		if (null != loansignbasics.getLoanCategory()
				&& loansignbasics.getLoanCategory() == 1) {
			sb.append(" and (loansign.loanstate=3 or loansign.loanstate=4)");
		}
		if (null != loansignbasics.getLoanCategory()
				&& loansignbasics.getLoanCategory() == 2) {
			sb.append(" and (loansign.loanstate=1 or loansign.loanstate=2)");
		}
		if (null != loansignbasics.getCreditTime()
				&& !"".equals(loansignbasics.getCreditTime())) {
			sb.append(" and loansign.publishTime>='")
					.append(loansignbasics.getCreditTime()).append("'");
		}
		if (null != loansignbasics.getLoanSignTime()
				&& !"".equals(loansignbasics.getLoanSignTime())) {
			sb.append(" and loansign.publishTime<='")
					.append(loansignbasics.getLoanSignTime()).append("'");
		}
		if (null != loansignbasics.getLoanExplain()
				&& !"".equals(loansignbasics.getLoanExplain())) {
			sb.append(" and loansignbasics.loanCategory =").append(
					loansignbasics.getLoanExplain());
		}
		if(null != loanType){
			sb.append(" and loansign.loansignType_id =").append(
					Integer.parseInt(loanType));
		}
		return sb.toString();
	}

	/**
	 * 生成还款记录
	 * 
	 * @param loansign
	 *            标详情
	 * @throws ParseException
	 */
	public void repaymentRecords(Loansign loansign) throws ParseException {
		if (loansign.getLoanType() == 1 && loansign.getRefundWay() == 1) {// 普通标-按月等额还息
//			List<CalculateLoan> calculateLoanList = loanSignFund.loanCalculate(
//					new BigDecimal(loansign.getIssueLoan().toString()),
//					loansign.getRate()+loansign.getLoansignbasics().getReward(),loansign.getMonth());
			
			loansign.setRate(loansign.getRate()+loansign.getLoansignbasics().getReward());
			List<CalculateLoan> calculateLoanList =Arith.loanCalculate(loansign);
			
			for (int i = 0; i < loansign.getMonth(); i++) {
				Repaymentrecord record = new Repaymentrecord();
				record.setPeriods(i + 1);
				record.setLoansign(loansign);
				record.setPreRepayDate(DateUtils.add(
						Constant.DEFAULT_DATE_FORMAT, Calendar.MONTH, i + 1));// 预计还款日期
				record.setMoney(calculateLoanList.get(i).getBenjin()
						.doubleValue());// 本金
				record.setPreRepayMoney(calculateLoanList.get(i).getLixi()
						.doubleValue());// 预计还款利息
				record.setRepayState(1);// 未还款
				dao.save(record);
			}
		} else if (loansign.getLoanType() == 1 && loansign.getRefundWay() == 2) {// 普通标-按月付息到期还本

			for (int i = 0; i < loansign.getMonth(); i++) {
				Repaymentrecord record = new Repaymentrecord();
				record.setPeriods(i + 1);
				record.setLoansign(loansign);
				record.setPreRepayDate(DateUtils.add(
						Constant.DEFAULT_DATE_FORMAT, Calendar.MONTH, i + 1));// 预计还款日期
				if (i + 1 == loansign.getMonth()
						&& loansign.getRefundWay() == 2) {
					record.setMoney(loansign.getIssueLoan());
				} else {
					record.setMoney(0.00);
				}
				record.setPreRepayMoney(loanSignFund.instalmentInterest(
						new BigDecimal(loansign.getIssueLoan()),
						loansign.getRate()+loansign.getLoansignbasics().getReward(), loansign.getMonth(),//Rate+loansign.getLoansignbasics().getReward()
						loansign.getLoanType()).doubleValue());// 预计还款利息
				record.setRepayState(1);// 未还款
				dao.save(record);
			}

		} else if (loansign.getLoanType() == 1 && loansign.getRefundWay() == 3) {// 普通标-一次性还本息
			Repaymentrecord record = new Repaymentrecord();
			record.setPeriods(1);
			record.setLoansign(loansign);
			record.setPreRepayDate(DateUtils.add(Constant.DEFAULT_DATE_FORMAT,
					Calendar.MONTH, loansign.getMonth()));// 预计还款日期
			record.setMoney(loansign.getIssueLoan());
			record.setPreRepayMoney((loanSignFund.instalmentInterest(
					new BigDecimal(loansign.getIssueLoan()),
					loansign.getRate()+loansign.getLoansignbasics().getReward(), loansign.getMonth(),
					loansign.getLoanType()).doubleValue())*loansign.getMonth());// 预计还款利息
			record.setRepayState(1);// 未还款
			dao.save(record);

		} else if (loansign.getLoanType() == 2) {// 天标
			Repaymentrecord record = new Repaymentrecord();
			record.setPeriods(1);
			record.setLoansign(loansign);
			record.setPreRepayDate(DateUtils.add(Constant.DEFAULT_DATE_FORMAT,
					Calendar.DATE, loansign.getUseDay()));// 预计还款日期
			record.setMoney(loansign.getIssueLoan());
			record.setPreRepayMoney(loanSignFund.instalmentInterest(
					new BigDecimal(loansign.getIssueLoan()),
					loansign.getRate()+loansign.getLoansignbasics().getReward(), loansign.getUseDay(),
					loansign.getLoanType()).doubleValue());// 预计还款利息
			record.setRepayState(1);// 未还款
			dao.save(record);
		}else if (loansign.getLoanType() == 3) {// 秒标
			Repaymentrecord record = new Repaymentrecord();
			record.setPeriods(1);
			record.setLoansign(loansign);
			record.setPreRepayDate(DateUtils.format("yyyy-MM-dd"));// 预计还款日期
			record.setMoney(loansign.getIssueLoan());
			record.setPreRepayMoney(loansign.getIssueLoan()*loansign.getRate());// 预计还款利息
			record.setRepayState(1);// 未还款
			dao.save(record);
		}
	}

	/**
	 * 根据借款人编号查询借款人的借款标信息
	 * 
	 * @param id
	 *            用户编号
	 * @param state
	 *            借款标状态
	 * @return 返回借款标集合
	 */
	public List<Loansign> getLoanBorrower(Long id, Integer state) {
		String hql = "from Loansign l where l.userbasicsinfo.id=? and l.loanstate=?";
		List<Loansign> loanList = dao.find(hql, id, state);
		return loanList;
	}

	/**
	 * 根据还款编号查询还款记录
	 * 
	 * @param id
	 *            还款编号
	 * @return 返回还款信息
	 */
	public Repaymentrecord getRepaymentId(Long id) {
		Repaymentrecord repaymentrecord = dao.get(Repaymentrecord.class, id);
		return repaymentrecord;
	}
	/**
	 * 查询给借款人发送信息需要在页面上显示的内容
	 * @param id 标编号
	 * @return 返回一个object数组
	 */
	public Object[] get(Long id){
		Loansign loan = loanSignQuery.getLoansignById(id.toString());
		String sql = "SELECT b.realName,b.isCard,u.phone,c.newaddress,s.companyName,u.email from borrowersbase b,borrowerscompany s,borrowerscontact c,userrelationinfo u WHERE b.id=s.id AND b.id=c.id AND b.userbasicinfo_id=u.id AND b.userbasicinfo_id=?";
		List<Object[]> list = dao.findBySql(sql, loan.getUserbasicsinfo().getId());
		if(list.size()>0&&null!=list){
			return list.get(0);
		}
		return null;
	}
	/**
     * 得到该标的所有金额
     * @return 返回金额总数
     */
    public double sumLoanMoney(Long loanid){
        String sql = "select sum(tenderMoney) from loanrecord where  isSucceed=1 and loanSign_id=?";
        List<Object> list = dao.findBySql(sql, loanid);
        if(null!=list&&list.size()>0){
            Object obj = list.get(0);
            if(null!=obj){
                return Double.parseDouble(obj.toString());
            }
        }
        
        return 0.00;
    }

}
