package com.luv2code.springsecurity.demo.entity;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;


@Entity
@Table(name="inbound")
public class InboundDocument {
	
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	@Column(name="id")
	private long id;
	
	@Column(name="job_id")
	private long jobId;
	
	@Column(name="barcode")
	private String barcode;
	
	@Column(name="document_type_id")
	private String docTemplate;
	
	@Column(name="policy_no")
	private String policyNo;
	
	@Column(name="processed_date")
	private Date processedDate;
	
	@Column(name="source_system")
	private String sourceSystem;
	
	@Column(name="distribution_method")
	private String distributionMethod;

	@OneToMany(fetch=FetchType.LAZY,
			   mappedBy="inboundDocument",
			   cascade= {CascadeType.DETACH, CascadeType.MERGE, CascadeType.PERSIST, CascadeType.REFRESH})
	private List<OutboundDocument> outboundDocuments;
	
	public InboundDocument() {}

	public InboundDocument( long jobId, String barcode, String docTemplate, String policyNo, Date processedDate,
			String sourceSystem, String distributionMethod) {
		this.jobId = jobId;
		this.barcode = barcode;
		this.docTemplate = docTemplate;
		this.policyNo = policyNo;
		this.processedDate = processedDate;
		this.sourceSystem = sourceSystem;
		this.distributionMethod = distributionMethod;
	}

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

	public String getDocTemplate() {
		return docTemplate;
	}

	public void setDocTemplate(String docTemplate) {
		this.docTemplate = docTemplate;
	}

	public String getPolicyNo() {
		return policyNo;
	}

	public void setPolicyNo(String policyNo) {
		this.policyNo = policyNo;
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

	@Override
	public String toString() {
		return "InboundDocument [id=" + id + ", jobId=" + jobId + ", barcode=" + barcode + ", docTemplate="
				+ docTemplate + ", policyNo=" + policyNo + ", processedDate=" + processedDate + ", sourceSystem="
				+ sourceSystem + ", distributionMethod=" + distributionMethod + "]";
	}
	
	public void add(OutboundDocument outDocuments) {
		if(outboundDocuments==null)
			outboundDocuments = new ArrayList<>();
		
		outboundDocuments.add(outDocuments);
		outDocuments.setInboundDocumets(this);
	}
}
