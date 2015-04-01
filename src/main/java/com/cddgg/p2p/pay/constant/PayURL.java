package com.cddgg.p2p.pay.constant;

import com.cddgg.p2p.pay.util.ParameterIpsUrl;

/**
 * 
 * 用于存放环讯接口访问地址的常量
 * @author RanQiBing 2014-01-03
 *
 */
public interface PayURL {

	/**用户注册地址**/
	String REGISTRATIONTESTURL = ParameterIpsUrl.getRegistrationurl();
	/**充值地址**/
	String RECHARGETESTURL = ParameterIpsUrl.getRechargeurl();
	/**投标**/
	String BIDTESTURL = ParameterIpsUrl.getBidurl();
	/**自动投标**/
	String AUTOMATICBIDTESTURL = ParameterIpsUrl.getAutomaticbidurl();
	/**还款**/
	String  REPAYMRNTTESTURL = ParameterIpsUrl.getRepaymenturl();
	/**提现**/
	String  WITHDRAWALTESTURL = ParameterIpsUrl.getWithdrawalurl();
	/**账户余额查询**/
	String BALABCEINQUIRYTESTURL = ParameterIpsUrl.getBalabceinquiryurl();
	/**商户端获取银行列表查询(WS)**/
	String BANKLISTQUERYTESTURL = ParameterIpsUrl.getBanklistqeryurl();
	
	/**调用webservice的方法**/
	/**账户余额**/
	String WEBBALANC = "QueryForAccBalance";
	/**获取银行列表**/
	String WEBBANK = "GetBankList";
}
