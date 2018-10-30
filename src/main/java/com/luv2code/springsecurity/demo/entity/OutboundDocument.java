package com.luv2code.springsecurity.demo.entity;

import java.util.Date;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="outbound")
public class OutboundDocument {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private long id;
	
	@Column(name="job_id")
	private long jobId;
	
	@Column(name="barcode")
	private String barcode;
	
	@Column(name="policy_no")
	private String policyNo;
	
	@Column(name="document_type_id")
	private String docTemplate;
	
	@Column(name="processed_date")
	private Date processedDate;
	
	@Column(name="source_system")
	private String sourceSystem;
	
	@Column(name="distribution_method")
	private String distributionMethod;
	
	@ManyToOne(fetch=FetchType.LAZY,cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	@JoinColumn(name="inbound_id")
	private InboundDocument inboundDocument;

	
//###########################################################	
	public OutboundDocument(long jobId, String barcode, String policyNo, String docTemplate, Date processedDate,
			String sourceSystem, String distributionMethod) {
		super();
		this.jobId = jobId;
		this.barcode = barcode;
		this.policyNo = policyNo;
		this.docTemplate = docTemplate;
		this.processedDate = processedDate;
		this.sourceSystem = sourceSystem;
		this.distributionMethod = distributionMethod;
	}
	
	public OutboundDocument() {}
//###########################################################	
	
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public long getJobId() {
		return jobId;
	}

	public void setJobId(long jobId) {
		this.jobId = jobId;
	}

	public String getBarcode() {
		return barcode;
	}

	public void setBarcode(String barcode) {
		this.barcode = barcode;
	}

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
	}

	public String getDocTemplate() {
		return docTemplate;
	}

	public void setDocTemplate(String docTemplate) {
		this.docTemplate = docTemplate;
	}

	public Date getProcessedDate() {
		return processedDate;
	}

	public void setProcessedDate(Date processedDate) {
		this.processedDate = processedDate;
	}

	public String getSourceSystem() {
		return sourceSystem;
	}

	public void setSourceSystem(String sourceSystem) {
		this.sourceSystem = sourceSystem;
	}

	public String getDistributionMethod() {
		return distributionMethod;
	}

	public void setDistributionMethod(String distributionMethod) {
		this.distributionMethod = distributionMethod;
	}

	public InboundDocument getInboundDocumets() {
		return inboundDocument;
	}

	public void setInboundDocumets(InboundDocument inboundDocumets) {
		this.inboundDocument = inboundDocumets;
	}

	@Override
	public String toString() {
		return "OutboundDocument [id=" + id + ", jobId=" + jobId + ", barcode=" + barcode + ", policyNo=" + policyNo
				+ ", docTemplate=" + docTemplate + ", processedDate=" + processedDate + ", sourceSystem=" + sourceSystem
				+ ", distributionMethod=" + distributionMethod + "]";
	}
	
	
}
