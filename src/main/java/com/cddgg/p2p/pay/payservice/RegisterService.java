package com.cddgg.p2p.pay.payservice;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.rmi.RemoteException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.cddgg.p2p.pay.entity.BalanceInquiryInfo;
import com.cddgg.p2p.pay.entity.BankInfo;
import com.cddgg.p2p.pay.entity.BankList;
import com.cddgg.p2p.pay.entity.RepaymentInfo;
import com.cddgg.p2p.pay.entity.ReturnInfo;
import com.cddgg.p2p.pay.util.BankInfoListUtil;
import com.cddgg.p2p.pay.util.ParameterIps;
import com.cddgg.p2p.pay.util.XmlParsingBean;
import com.ips.security.utility.IpsCrypto;

/**
 * 
 * 根据用户传入的数据访问环讯
 * 
 * @author QanQiBing 2013-01-03
 * 
 */
public class RegisterService {
	/**
	 * 加密信息并返回加密后的信息
	 * @param registerCall 提交信息的xml文件
	 * @return 返回加密后的文件集合
	 */
	public static Map<String,String> registerCall(String registerCall){
		//生成xml文件字符串
		//String  = ParseXML.registration(entity);
		//将生成的xml文件进行3des加密
		String desede = IpsCrypto.triDesEncrypt(registerCall,ParameterIps.getDes_algorithm(),ParameterIps.getDesedevector());
		//将加密后的字符串不换行
		desede = desede.replaceAll("\r\n","");
		//将“ 平台 ”账号 、用户注册信息、证书拼接成一个字符串
		StringBuffer argSign = new StringBuffer(ParameterIps.getCert()).append(desede).append(ParameterIps.getMd5ccertificate());
		//将argSign进行MD5加密
		String md5 = IpsCrypto.md5Sign(argSign.toString());
		//将参数装进map里面
		Map<String,String> map = new HashMap<String, String>();
		map.put("argMerCode",ParameterIps.getCert());
		map.put("arg3DesXmlPara", desede);
		map.put("argSign",md5);
		return map;
	}
	/**
	 * 解析xml文件
	 * @param registerCall 环讯返回信息的xml文件
	 * @param obj 需要解析成的对象
	 * @return 返回实体对象
	 * @throws UnsupportedEncodingException 
	 * @throws FileNotFoundException 
	 */
	public static Object decryption(String registerCall,Object obj) throws FileNotFoundException, UnsupportedEncodingException{
		return XmlParsingBean.simplexml1Object(registerCall, obj);
	}
	/**
	 * 得到银行信息集合
	 * @return 返回银行信息集合对象
	 */
	public static List<BankInfo> bankList(){
		List<BankInfo> bankList = new ArrayList<BankInfo>();
		BankList bank = null;
		try {
			bank = WebService.bankList();
			bankList = BankInfoListUtil.dismantling(bank);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return bankList;
	}
	/**
	 * 
	 * 获取平台或商户余额
	 * @param merchantNo 平台或商户账号
	 * @return 返回商户余额信息
	 */
	public static BalanceInquiryInfo accountBalance(String merchantNo){
		try {
			return WebService.accountBalance(merchantNo);
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		} catch (RemoteException e) {
			e.printStackTrace();
		}
		return null;
	}
	/**
	 * 投资审核 
	 * @param map 加密后的集合信息
	 * @return 返回放款处理后的信息
	 * @throws RemoteException
	 * @throws UnsupportedEncodingException 
	 * @throws FileNotFoundException 
	 */
	public static ReturnInfo auditTender(Map<String,String> map) throws RemoteException, FileNotFoundException, UnsupportedEncodingException{
	     return  WebService.loans(map.get("argMerCode"), map.get("arg3DesXmlPara"), map.get("argSign"));
	}
	/**
	 * 将xml信息解析成对象
	 * @param xml xml信息
	 */
	public static RepaymentInfo repaymentXml(String xml){
	    return XmlParsingBean.parseXml(xml);
	}
}
