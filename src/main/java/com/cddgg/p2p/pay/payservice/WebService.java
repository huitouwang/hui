package com.cddgg.p2p.pay.payservice;

import java.io.FileNotFoundException;
import java.io.UnsupportedEncodingException;
import java.rmi.RemoteException;

import org.tempuri.ServiceSoap;
import org.tempuri.ServiceSoapProxy;

import com.cddgg.p2p.pay.entity.BalanceInquiryInfo;
import com.cddgg.p2p.pay.entity.BankList;
import com.cddgg.p2p.pay.entity.RepaymentInfo;
import com.cddgg.p2p.pay.entity.ReturnInfo;
import com.cddgg.p2p.pay.util.ParameterIps;
import com.cddgg.p2p.pay.util.XmlParsingBean;
import com.ips.security.utility.IpsCrypto;

/**
 * webservices请求并返回数据
 * @author RanQiBing 2013-01-14
 *
 */
public class WebService {
	/**
	 * 查询平台或商户余额
	 * @param merchantNo 平台或商户账号
	 * @return 返回商户余额
	 * @throws UnsupportedEncodingException 
	 * @throws FileNotFoundException 
	 * @throws RemoteException 
	 */
	public static BalanceInquiryInfo accountBalance(String merchantNo) throws FileNotFoundException, UnsupportedEncodingException, RemoteException{
		StringBuffer argSign = new StringBuffer(ParameterIps.getCert()).append(merchantNo) .append(ParameterIps.getMd5ccertificate());
		String md5argSign = IpsCrypto.md5Sign(argSign.toString());//进行Md5加密
		//获取返回数据
		ServiceSoap serviceSoap = new ServiceSoapProxy();
		String argXmlPara = serviceSoap.queryForAccBalance(ParameterIps.getCert(), merchantNo, md5argSign);
		BalanceInquiryInfo bal = new BalanceInquiryInfo();
		return (BalanceInquiryInfo) XmlParsingBean.simplexml2Object(argXmlPara,bal);
	}
	/**
	 * 获取银行列表
	 * @return 返回银行信息列表
	 * @throws UnsupportedEncodingException 
	 * @throws FileNotFoundException 
	 * @throws RemoteException 
	 */
	public static BankList bankList() throws FileNotFoundException, UnsupportedEncodingException, RemoteException{
		StringBuffer argSign = new StringBuffer(ParameterIps.getCert()).append(ParameterIps.getMd5ccertificate());
		String md5 = IpsCrypto.md5Sign(argSign.toString());
		
		ServiceSoap serviceSoap = new ServiceSoapProxy();
		String argXmlPara = serviceSoap.getBankList(ParameterIps.getCert(),md5);
		
		BankList bank=new BankList();
		return (BankList) XmlParsingBean.simplexml2Object(argXmlPara,bank);
	}
	/**
	 * 审核投标
	 * @param argMerCode 商户号 
	 * @param arg3DesXmlPara 3des加密后的信息
	 * @param argSign md5加密后的报文
	 * @throws RemoteException 
	 * @return 返回放款处理后的信息
	 * @throws UnsupportedEncodingException 
	 * @throws FileNotFoundException 
	 */
	public static ReturnInfo loans(String argMerCode,String arg3DesXmlPara,String argSign) throws RemoteException, FileNotFoundException, UnsupportedEncodingException{
	    
	    ServiceSoap serviceSoap = new ServiceSoapProxy();
	    
	    String info = serviceSoap.auditTender(argMerCode, arg3DesXmlPara, argSign);
	   
	    ReturnInfo returnInfo = (ReturnInfo) XmlParsingBean.simplexml2Object(info,new ReturnInfo());
	    
	    return returnInfo;
	} 
	/**
	 * 将xml信息解析成对象
	 * @param xml xml信息
	 */
	public static RepaymentInfo repaymentXml(String xml){
	    return XmlParsingBean.parseXml(xml);
	}
}
