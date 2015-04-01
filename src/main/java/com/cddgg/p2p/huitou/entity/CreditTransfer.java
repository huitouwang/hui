package com.cddgg.p2p.huitou.entity;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * Loanrecord
 */
@Entity
@Table(name = "credittransfer")
public class CreditTransfer implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	
	private Long id;
	
	/**
	 * 会员基本信息
	 */
	private Userbasicsinfo userbasicsinfo;
	
	private String pMerBillNo;
	private String pMerDate;
	private String pBidNo;
	private String pContractNo;
	private String pFromAccountType;
	private String pFromName;
	private String pFromAccount;
	private String pFromIdentType;
	private String pFromIdentNo;
	private String pToAccountType;
	private String pToAccountName;
	private String pToAccount;
	private String pToIdentType;
	private String pToIdentNo;
	private String pCreMerBillNo;
	private Double pCretAmt;
	private Double pPayAmt;
	private Double pFromFee;
	private Double pToFee;
	private String pCretType;
	private String pWebUrl;
	private String pS2SUrl;
	private String pMemo;
	
	// Constructors

	/** default constructor */
	public CreditTransfer() {
	}
	
	/**
	 *购买借款标信息
	 */
	private Loansign loansign;
	public Loansign getLoansign() {
		return loansign;
	}

	public void setLoansign(Loansign loansign) {
		this.loansign = loansign;
	}

	public Userbasicsinfo getUserbasicsinfo() {
		return userbasicsinfo;
	}

	public void setUserbasicsinfo(Userbasicsinfo userbasicsinfo) {
		this.userbasicsinfo = userbasicsinfo;
	}

	@Column(name = "pMerBillNo")
	public String getpMerBillNo() {
		return pMerBillNo;
	}

	public void setpMerBillNo(String pMerBillNo) {
		this.pMerBillNo = pMerBillNo;
	}
	
	@Column(name = "pMerDate")
	public String getpMerDate() {
		return pMerDate;
	}

	public void setpMerDate(String pMerDate) {
		this.pMerDate = pMerDate;
	}

	@Column(name = "pBidNo")
	public String getpBidNo() {
		return pBidNo;
	}

	public void setpBidNo(String pBidNo) {
		this.pBidNo = pBidNo;
	}

	@Column(name = "pContractNo")
	public String getpContractNo() {
		return pContractNo;
	}

	public void setpContractNo(String pContractNo) {
		this.pContractNo = pContractNo;
	}

	@Column(name = "pFromAccountType")
	public String getpFromAccountType() {
		return pFromAccountType;
	}

	public void setpFromAccountType(String pFromAccountType) {
		this.pFromAccountType = pFromAccountType;
	}

	@Column(name = "pFromName")
	public String getpFromName() {
		return pFromName;
	}

	public void setpFromName(String pFromName) {
		this.pFromName = pFromName;
	}

	@Column(name = "pFromAccount")
	public String getpFromAccount() {
		return pFromAccount;
	}

	public void setpFromAccount(String pFromAccount) {
		this.pFromAccount = pFromAccount;
	}

	@Column(name = "pFromIdentType")
	public String getpFromIdentType() {
		return pFromIdentType;
	}

	public void setpFromIdentType(String pFromIdentType) {
		this.pFromIdentType = pFromIdentType;
	}

	@Column(name = "pFromIdentNo")
	public String getpFromIdentNo() {
		return pFromIdentNo;
	}

	public void setpFromIdentNo(String pFromIdentNo) {
		this.pFromIdentNo = pFromIdentNo;
	}

	@Column(name = "pToAccountType")
	public String getpToAccountType() {
		return pToAccountType;
	}

	public void setpToAccountType(String pToAccountType) {
		this.pToAccountType = pToAccountType;
	}

	@Column(name = "pToAccountName")
	public String getpToAccountName() {
		return pToAccountName;
	}

	public void setpToAccountName(String pToAccountName) {
		this.pToAccountName = pToAccountName;
	}

	@Column(name = "pToAccount")
	public String getpToAccount() {
		return pToAccount;
	}

	public void setpToAccount(String pToAccount) {
		this.pToAccount = pToAccount;
	}

	@Column(name = "pToIdentType")
	public String getpToIdentType() {
		return pToIdentType;
	}

	public void setpToIdentType(String pToIdentType) {
		this.pToIdentType = pToIdentType;
	}

	@Column(name = "pToIdentNo")
	public String getpToIdentNo() {
		return pToIdentNo;
	}

	public void setpToIdentNo(String pToIdentNo) {
		this.pToIdentNo = pToIdentNo;
	}

	@Column(name = "pCreMerBillNo")
	public String getpCreMerBillNo() {
		return pCreMerBillNo;
	}

	public void setpCreMerBillNo(String pCreMerBillNo) {
		this.pCreMerBillNo = pCreMerBillNo;
	}

	@Column(name = "pCretAmt")
	public Double getpCretAmt() {
		return pCretAmt;
	}

	public void setpCretAmt(Double pCretAmt) {
		this.pCretAmt = pCretAmt;
	}

	@Column(name = "pPayAmt")
	public Double getpPayAmt() {
		return pPayAmt;
	}

	public void setpPayAmt(Double pPayAmt) {
		this.pPayAmt = pPayAmt;
	}

	@Column(name = "pFromFee")
	public Double getpFromFee() {
		return pFromFee;
	}

	public void setpFromFee(Double pFromFee) {
		this.pFromFee = pFromFee;
	}

	@Column(name = "pToFee")
	public Double getpToFee() {
		return pToFee;
	}

	public void setpToFee(Double pToFee) {
		this.pToFee = pToFee;
	}

	@Column(name = "pCretType")
	public String getpCretType() {
		return pCretType;
	}

	public void setpCretType(String pCretType) {
		this.pCretType = pCretType;
	}

	@Column(name = "pWebUrl")
	public String getpWebUrl() {
		return pWebUrl;
	}

	public void setpWebUrl(String pWebUrl) {
		this.pWebUrl = pWebUrl;
	}

	@Column(name = "pS2SUrl")
	public String getpS2SUrl() {
		return pS2SUrl;
	}

	public void setpS2SUrl(String pS2SUrl) {
		this.pS2SUrl = pS2SUrl;
	}

	@Column(name = "pMemo")
	public String getpMemo() {
		return pMemo;
	}

	public void setpMemo(String pMemo) {
		this.pMemo = pMemo;
	}
	
	
	// Property accessors
	/**
	 * 
	 * @return id
	 */
	@Id
	@GeneratedValue(strategy = IDENTITY)
	@Column(name = "id", unique = true, nullable = false)
	public Long getId() {
		return this.id;
	}
	/**
	 * 
	 * @param id id
	 */
	public void setId(Long id) {
		this.id = id;
	}

}