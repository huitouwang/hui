package com.cddgg.p2p.huitou.entity;

import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.OneToOne;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

/**
 * Loansign
 */
@SuppressWarnings("serial")
@Entity
@Table(name = "loansign")
public class Loansign implements java.io.Serializable {

    // Fields
    /**
     * id
     */
    private Long id;
    /** 借款人基本信息 */
    private Userbasicsinfo userbasicsinfo;
    /** 利率 */
    private Double rate;
    /** 本期借款额 */
    private Double issueLoan;
    /** 借款标类型：1普通标、2天标、3秒标、4流转标 */
    private Integer loanType;
    /** 借款标状态：1未发布、2进行中、3回款中、4已完成 、5流标*/
    private Integer loanstate;
    /** 预计使用天数 */
    private Integer useDay;
    /** 实际借款天数 */
    private Integer realDay;
    /** 是否显示：1显示，2不显示 */
    private Integer isShow;
    /** 是否推荐到首页：1推荐，2不推荐 */
    private Integer isRecommand;
    /** 还款方式：1按月等额本息、2按月付息到期还本、3到期一次性还本息 */
    private Integer refundWay;
    /** 最小出借单位：100、200、300、500、1000 */
    private Integer loanUnit;
    /** 还款期限 */
    private Integer month;
    /** 发布时间 */
    private String publishTime;
    /** 结束时间 */
    private String endTime;
    /** 特权用户管理费上限 */
    private Double pmfeetop;
    /** 投资人管理费比例 */
    private Double mfeeratio;
    /** 管理费上限 */
    private Double mfeetop;
    /** 投资人特权用户管理费比例 */
    private Double pmfeeratio;

    /**
     * 借款人管理费
     */
    private Double other;
    /**
     * 借款人管理费
     */
    private Double others;
    /**
     * 借款者上线(VIP用户上限金额)
     */
    private Double highLines;

    /**
     * 提前还款利率
     */
    private Double prepaymentRate;
    /**
     * 逾期还款利率
     */
    private Double overdueRepayment;
    /**
     * 借款标类型
     */
    private LoansignType loansignType;
    /**
     * 普通会员最大购买份数
     */
    private Integer counterparts;
    /**
     * vip最大购买份数
     */
    private Integer vipCounterparts;
    /**
     * 借款标基础信息
     */
    private Loansignbasics loansignbasics;
    
    /**
     * 借款申请记录
     */
    private BorrowersApply borrowersApply;
    /** 还款信息集合 */
    private Set<Repaymentrecord> repaymentrecords = new HashSet<Repaymentrecord>(
            0);
    /** 借入记录 */
    private Set<Loanrecord> loanrecords = new HashSet<Loanrecord>(0);
    /** Autointegral */
    private Set<Autointegral> autointegrals = new HashSet<Autointegral>(0);
    /** Loansignbasics */
    private Set<Loansignbasics> loansignbasicses = new HashSet<Loansignbasics>(
            0);
    /** Attachment */
    private Set<Attachment> attachments = new HashSet<Attachment>(0);
    /** Comment */
    private Set<Comment> comments = new HashSet<Comment>(0);

    // Constructors

    /** default constructor */
    public Loansign() {
    }

    /**
     * id
     * 
     * @param id
     *            id
     */
    public Loansign(Long id) {
        this.id = id;
    }

    /** full constructor */
    /**
     * @param userbasicsinfo
     *            会员基本信息
     * @param rate
     *            利率
     * @param issueLoan
     *            本期借款金额
     * @param loanType
     *            标类型
     * @param loanstate
     *            借款标状态
     * @param useDay
     *            预计使用天数
     * @param realDay
     *            实际使用天数
     * @param isShow
     *            是否显示
     * @param isRecommand
     *            是否推荐到首页：1推荐，2不推荐
     * @param refundWay
     *            还款方式
     * @param loanUnit
     *            最小出借单位
     * @param month
     *            还款期限
     * @param publishTime
     *            发布时间
     * @param endTime
     *            结束时间
     * @param mfeeratio
     *            管理费比例
     * @param mfeetop
     *            管理费上限
     * @param pmfeeratio
     *            特权用户管理费比例
     * @param pmfeetop
     *            特权用户管理费上限
     * @param repaymentrecords
     *            还款集合
     * @param loanrecords
     *            loanrecords
     * @param autointegrals
     *            autointegrals
     * @param loansignbasicses
     *            loansignbasicses
     * @param attachments
     *            attachments
     * @param comments
     *            comments
     */
    public Loansign(Userbasicsinfo userbasicsinfo, Double rate,
            Double issueLoan, Integer loanType, Integer loanstate,
            Integer useDay, Integer realDay, Integer isShow,
            Integer isRecommand, Integer refundWay, Integer loanUnit,
            Integer month, String publishTime, String endTime,
            Double mfeeratio, Double pmfeeratio, Double mfeetop,
            Double pmfeetop, Double prepaymentRate, Double overdueRepayment,
            Integer counterparts, Integer vipCounterparts,
            Set<Repaymentrecord> repaymentrecords, Set<Loanrecord> loanrecords,
            Set<Autointegral> autointegrals,
            Set<Loansignbasics> loansignbasicses, Set<Attachment> attachments,
            Set<Comment> comments, Double other,Double others, Double highLines,BorrowersApply borrowersApply) {
        this.userbasicsinfo = userbasicsinfo;
        this.rate = rate;
        this.issueLoan = issueLoan;
        this.loanType = loanType;
        this.loanstate = loanstate;
        this.useDay = useDay;
        this.realDay = realDay;
        this.isShow = isShow;
        this.isRecommand = isRecommand;
        this.refundWay = refundWay;
        this.loanUnit = loanUnit;
        this.month = month;
        this.publishTime = publishTime;
        this.endTime = endTime;
        this.mfeeratio = mfeeratio;
        this.pmfeeratio = pmfeeratio;
        this.pmfeetop = pmfeetop;
        this.mfeetop = mfeetop;
        this.prepaymentRate = prepaymentRate;
        this.overdueRepayment = overdueRepayment;
        this.counterparts = counterparts;
        this.vipCounterparts = vipCounterparts;
        this.repaymentrecords = repaymentrecords;
        this.loanrecords = loanrecords;
        this.autointegrals = autointegrals;
        this.loansignbasicses = loansignbasicses;
        this.attachments = attachments;
        this.comments = comments;
        this.other = other;
        this.others = others;
        this.highLines = highLines;
        this.borrowersApply = borrowersApply;
    }

    // Property accessors
    /**
     * id
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
     * id
     * 
     * @param id
     *            id
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * userbasicsinfo
     * 
     * @return userbasicsinfo
     */
    @ManyToOne()
    @JoinColumn(name = "userbasicinfo_id")
    public Userbasicsinfo getUserbasicsinfo() {
        return this.userbasicsinfo;
    }

    /**
     * userbasicsinfo
     * 
     * @param userbasicsinfo
     *            userbasicsinfo
     */
    public void setUserbasicsinfo(Userbasicsinfo userbasicsinfo) {
        this.userbasicsinfo = userbasicsinfo;
    }

    /**
     * rate
     * 
     * @return rate
     */
    @Column(name = "rate", precision = 18, scale = 4)
    public Double getRate() {
        return this.rate;
    }

    /**
     * rate
     * 
     * @param rate
     *            rate
     */
    public void setRate(Double rate) {
        this.rate = rate;
    }

    /**
     * issueLoan
     * 
     * @return issueLoan
     */
    @Column(name = "issueLoan", precision = 18, scale = 4)
    public Double getIssueLoan() {
        return this.issueLoan;
    }

    /**
     * issueLoan
     * 
     * @param issueLoan
     *            issueLoan
     */
    public void setIssueLoan(Double issueLoan) {
        this.issueLoan = issueLoan;
    }

    /**
     * @return loanType
     */
    @Column(name = "loanType")
    public Integer getLoanType() {
        return this.loanType;
    }

    /**
     * @param loanType
     *            loanType
     */
    public void setLoanType(Integer loanType) {
        this.loanType = loanType;
    }

    /**
     * @return loanstate
     */
    @Column(name = "loanstate")
    public Integer getLoanstate() {
        return this.loanstate;
    }

    /**
     * @param loanstate
     *            loanstate
     */
    public void setLoanstate(Integer loanstate) {
        this.loanstate = loanstate;
    }

    /**
     * useDay
     * 
     * @return useDay
     */
    @Column(name = "useDay")
    public Integer getUseDay() {
        return this.useDay;
    }

    /**
     * useDay
     * 
     * @param useDay
     *            useDay
     */
    public void setUseDay(Integer useDay) {
        this.useDay = useDay;
    }

    /**
     * realDay
     * 
     * @return realDay
     */
    @Column(name = "realDay")
    public Integer getRealDay() {
        return this.realDay;
    }

    /**
     * 
     * @param realDay
     *            realDay
     */
    public void setRealDay(Integer realDay) {
        this.realDay = realDay;
    }

    /**
     * @return isShow
     */
    @Column(name = "isShow")
    public Integer getIsShow() {
        return this.isShow;
    }

    /**
     * isShow
     * 
     * @param isShow
     *            isShow
     */
    public void setIsShow(Integer isShow) {
        this.isShow = isShow;
    }

    /**
     * isRecommand
     * 
     * @return isRecommand
     */
    @Column(name = "isRecommand")
    public Integer getIsRecommand() {
        return this.isRecommand;
    }

    /**
     * 
     * @param isRecommand
     *            isRecommand
     */
    public void setIsRecommand(Integer isRecommand) {
        this.isRecommand = isRecommand;
    }

    /**
     * 
     * @return refundWay
     */
    @Column(name = "refundWay")
    public Integer getRefundWay() {
        return this.refundWay;
    }

    /**
     * 
     * @param refundWay
     *            refundWay
     */
    public void setRefundWay(Integer refundWay) {
        this.refundWay = refundWay;
    }

    /**
     * 
     * @return loanUnit
     */
    @Column(name = "loanUnit")
    public Integer getLoanUnit() {
        return this.loanUnit;
    }

    /**
     * 
     * @param loanUnit
     *            loanUnit
     */
    public void setLoanUnit(Integer loanUnit) {
        this.loanUnit = loanUnit;
    }

    /**
     * 
     * @return month
     */
    @Column(name = "month")
    public Integer getMonth() {
        return this.month;
    }

    /**
     * 
     * @param month
     *            month
     */
    public void setMonth(Integer month) {
        this.month = month;
    }

    /**
     * 
     * @return publishTime
     */
    @Column(name = "publishTime", length = 50)
    public String getPublishTime() {
        return this.publishTime;
    }

    /**
     * 
     * @param publishTime
     *            publishTime
     */
    public void setPublishTime(String publishTime) {
        this.publishTime = publishTime;
    }

    /**
     * 
     * @return endTime
     */
    @Column(name = "endTime", length = 50)
    public String getEndTime() {
        return this.endTime;
    }

    /**
     * 
     * @param endTime
     *            endTime
     */
    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    /**
     * 
     * @return mfeeratio
     */
    @Column(name = "mfeeratio", precision = 18, scale = 4)
    public Double getMfeeratio() {
        return this.mfeeratio;
    }

    /**
     * 
     * @param mfeeratio
     *            mfeeratio
     */
    public void setMfeeratio(Double mfeeratio) {
        this.mfeeratio = mfeeratio;
    }

    /**
     * 
     * @return pmfeeratio
     */
    @Column(name = "pmfeeratio", precision = 18, scale = 4)
    public Double getPmfeeratio() {
        return this.pmfeeratio;
    }

    /**
     * 
     * @param pmfeeratio
     *            pmfeeratio
     */
    public void setPmfeeratio(Double pmfeeratio) {
        this.pmfeeratio = pmfeeratio;
    }

    /**
     * 提前还款利率
     * 
     * @return prepaymentRate
     */
    @Column(name = "prepaymentRate", precision = 18, scale = 4)
    public Double getPrepaymentRate() {
        return prepaymentRate;
    }

    /**
     * @param prepaymentRate
     *            提前还款利率
     */
    public void setPrepaymentRate(Double prepaymentRate) {
        this.prepaymentRate = prepaymentRate;
    }

    /**
     * 逾期还款
     * 
     * @return overdueRepayment
     */
    @Column(name = "overdueRepayment", precision = 18, scale = 4)
    public Double getOverdueRepayment() {
        return overdueRepayment;
    }

    /**
     * @param overdueRepayment
     *            逾期还款
     */
    public void setOverdueRepayment(Double overdueRepayment) {
        this.overdueRepayment = overdueRepayment;
    }

    /**
     * 普通会员最大购买份数
     * 
     * @return counterparts
     */
    @Column(name = "counterparts")
    public Integer getCounterparts() {
        return counterparts;
    }

    /**
     * @param counterparts
     *            普通会员最大购买份数
     */
    public void setCounterparts(Integer counterparts) {
        this.counterparts = counterparts;
    }

    /**
     * vip最大购买份数
     * 
     * @return vipCounterparts
     */
    @Column(name = "vipCounterparts")
    public Integer getVipCounterparts() {
        return vipCounterparts;
    }

    /**
     * @param vipCounterparts
     *            vip最大购买份数
     */
    public void setVipCounterparts(Integer vipCounterparts) {
        this.vipCounterparts = vipCounterparts;
    }

    /**
     * @return repaymentrecords
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Repaymentrecord> getRepaymentrecords() {
        return this.repaymentrecords;
    }

    /**
     * 
     * @param repaymentrecords
     *            repaymentrecords
     */
    public void setRepaymentrecords(Set<Repaymentrecord> repaymentrecords) {
        this.repaymentrecords = repaymentrecords;
    }

    /**
     * 
     * @return loanrecords
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Loanrecord> getLoanrecords() {
        return this.loanrecords;
    }

    /**
     * 
     * @param loanrecords
     *            loanrecords
     */
    public void setLoanrecords(Set<Loanrecord> loanrecords) {
        this.loanrecords = loanrecords;
    }

    /**
     * 
     * @return autointegrals
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Autointegral> getAutointegrals() {
        return this.autointegrals;
    }

    /**
     * 
     * @param autointegrals
     *            autointegrals
     */
    public void setAutointegrals(Set<Autointegral> autointegrals) {
        this.autointegrals = autointegrals;
    }

    /**
     * 
     * @return loansignbasicses
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Loansignbasics> getLoansignbasicses() {
        return this.loansignbasicses;
    }

    /**
     * 
     * @param loansignbasicses
     *            loansignbasicses
     */
    public void setLoansignbasicses(Set<Loansignbasics> loansignbasicses) {
        this.loansignbasicses = loansignbasicses;
    }

    /**
     * 
     * @return attachments
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Attachment> getAttachments() {
        return this.attachments;
    }

    /**
     * 
     * @param attachments
     *            attachments
     */
    public void setAttachments(Set<Attachment> attachments) {
        this.attachments = attachments;
    }

    /**
     * 
     * @return comments
     */
    @OneToMany(cascade = CascadeType.ALL, fetch = FetchType.LAZY, mappedBy = "loansign")
    public Set<Comment> getComments() {
        return this.comments;
    }

    /**
     * 
     * @param comments
     *            comments
     */
    public void setComments(Set<Comment> comments) {
        this.comments = comments;
    }

    @ManyToOne()
    @JoinColumn(name = "loansignType_id")
    public LoansignType getLoansignType() {
        return loansignType;
    }

    public void setLoansignType(LoansignType loansignType) {
        this.loansignType = loansignType;
    }

    @OneToOne
    @JoinColumn(name = "id")
    public Loansignbasics getLoansignbasics() {
        return loansignbasics;
    }

    public void setLoansignbasics(Loansignbasics loansignbasics) {
        this.loansignbasics = loansignbasics;
    }

    /**
     * 
     * @return mfeetop
     */
    @Column(name = "mfeetop", precision = 18, scale = 4)
    public Double getMfeetop() {
        return this.mfeetop;
    }

    /**
     * 
     * @param mfeetop
     *            mfeetop
     */
    public void setMfeetop(Double mfeetop) {
        this.mfeetop = mfeetop;
    }

    /**
     * 
     * @return pmfeetop
     */
    @Column(name = "pmfeetop", precision = 18, scale = 4)
    public Double getPmfeetop() {
        return this.pmfeetop;
    }

    /**
     * 
     * @param pmfeetop
     *            pmfeetop
     */
    public void setPmfeetop(Double pmfeetop) {
        this.pmfeetop = pmfeetop;
    }

    /**
     * 借款者管理费
     * 
     * @return other
     */
    @Column(name = "other")
    public Double getOther() {
        return other;
    }

    /**
     * @param other
     *            借款者管理费
     */
    public void setOther(Double other) {
        this.other = other;
    }
    /**
     * 借款者管理费
     * 
     * @return other
     */
    @Column(name = "others")
    public Double getOthers() {
        return others;
    }

    /**
     * @param other
     *            借款者管理费
     */
    public void setOthers(Double others) {
        this.others = others;
    }

    /**
     * 借款者上线(VIP用户上限金额)
     * 
     * @return highLines
     */
    @Column(name = "highLines")
    public Double getHighLines() {
        return highLines;
    }

    /**
     * 借款者上线(VIP用户上限金额)
     * 
     * @param highLines
     *            借款者上线(VIP用户上限金额)
     */
    public void setHighLines(Double highLines) {
        this.highLines = highLines;
    }

    @ManyToOne()
    @JoinColumn(name = "borrowersApply_id")
	public BorrowersApply getBorrowersApply() {
		return borrowersApply;
	}

	public void setBorrowersApply(BorrowersApply borrowersApply) {
		this.borrowersApply = borrowersApply;
	}

    
}