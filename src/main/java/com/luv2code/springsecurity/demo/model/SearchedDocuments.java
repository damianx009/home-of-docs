package com.luv2code.springsecurity.demo.model;

import java.util.List;

public class SearchedDocuments {
	
	private String jobId;
	private String barcode;
	private String policyNo;
	private String documentId;
	private List<String> sourceSystem;
	private List<String> distributionMethod;
	private String processedDateFrom;
	private String processedDateTo;
	
	public SearchedDocuments() {}

	public SearchedDocuments(String jobId, String barcode, String policyNo, String documentId, List<String> sourceSystem,
			List<String> distributionMethod, String processedDateFrom, String processedDateTo) {
		this.jobId = jobId;
		this.barcode = barcode;
		this.policyNo = policyNo;
		this.documentId = documentId;
		this.sourceSystem = sourceSystem;
		this.distributionMethod = distributionMethod;
		this.processedDateFrom = processedDateFrom;
		this.processedDateTo = processedDateTo;
	}

	public String getJobId() {
		return jobId;
	}

	public void setJobId(String jobId) {
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

	public String getDocumentId() {
		return documentId;
	}

	public void setDocumentId(String documentId) {
		this.documentId = documentId;
	}

	public List<String> getSourceSystem() {
		return sourceSystem;
	}

	public void setSourceSystem(List<String> sourceSystem) {
		this.sourceSystem = sourceSystem;
	}

	public List<String> getDistributionMethod() {
		return distributionMethod;
	}

	public void setDistributionMethod(List<String> distributionMethod) {
		this.distributionMethod = distributionMethod;
	}

	public String getProcessedDateFrom() {
		return processedDateFrom;
	}

	public void setProcessedDateFrom(String processedDateFrom) {
		this.processedDateFrom = processedDateFrom;
	}

	public String getProcessedDateTo() {
		return processedDateTo;
	}

	public void setProcessedDateTo(String processedDateTo) {
		this.processedDateTo = processedDateTo;
	}

	@Override
	public String toString() {
		return "SearchedDocuments [jobId=" + jobId + ", barcode=" + barcode + ", policyNo=" + policyNo + ", documentId="
				+ documentId + ", sourceSystem=" + sourceSystem + ", distributionMethod=" + distributionMethod
				+ ", processedDateFrom=" + processedDateFrom + ", processedDateTo=" + processedDateTo + "]";
	}
	
	public boolean isEmpty() {
		
		boolean result = true;
		
		if (barcode != null || jobId!= null || policyNo!=null || documentId != null
			|| sourceSystem != null || processedDateFrom != null || processedDateTo != null || distributionMethod != null)
			result = false;
		
		return result;
	}
	
}
