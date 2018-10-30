package com.luv2code.springsecurity.demo.dao;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.List;

import javax.persistence.Query;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.luv2code.springsecurity.demo.entity.OutboundDocument;
import com.luv2code.springsecurity.demo.model.SearchedDocuments;

@Repository
public class OutboundDocumentDAOImpl implements OutboundDocumentDAO {

	@Autowired
	private SessionFactory sessionFactory;
	
	@Override
	public List<OutboundDocument> getAllOutboundDocuments() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<OutboundDocument> outs = session.createQuery("from OutboundDocument").getResultList();
		return outs;
	}

	@Override
	public List<OutboundDocument> getSearchedOutboundDocuments(SearchedDocuments seachedDocuments) {
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
		String query = "from OutboundDocument O ";
		if(!seachedDocuments.isEmpty())
			query = query +"WHERE 1=1 ";
		if(seachedDocuments.getJobId() != null)
			query = query + "AND O.jobId like concat('%',:jobId,'%') ";
		if(seachedDocuments.getBarcode() != null)
			query = query + "AND O.barcode like concat('%',:barcode,'%') ";
		if(seachedDocuments.getPolicyNo() != null)
			query = query + "AND O.policyNo like concat('%',:policyNo,'%') ";
		if(seachedDocuments.getDocumentId() != null)
			query = query + "AND O.docTemplate like concat('%',:docId,'%') ";
		if(seachedDocuments.getSourceSystem() != null)
			query = query + "AND O.sourceSystem IN (:sourceSystem) ";
		if(seachedDocuments.getDistributionMethod() != null)
			query = query + "AND O.distributionMethod IN (:distributionMethod) ";
		if(seachedDocuments.getProcessedDateFrom() != null)
			query = query + "AND O.processedDate >= :processedDateFrom ";
		if(seachedDocuments.getProcessedDateTo() != null)
			query = query + "AND O.processedDate <= :processedDateTo ";
		
		query = query +"order by O.processedDate desc";
		
		Session session = sessionFactory.getCurrentSession();
		Query q = session.createQuery(query);
		
		if(seachedDocuments.getJobId() != null)
			q.setParameter("jobId", seachedDocuments.getJobId());
		if(seachedDocuments.getBarcode() != null)
			q.setParameter("barcode", seachedDocuments.getBarcode());
		if(seachedDocuments.getPolicyNo() != null)
			q.setParameter("policyNo", seachedDocuments.getPolicyNo());
		if(seachedDocuments.getDocumentId() != null)
			q.setParameter("docId", seachedDocuments.getDocumentId());
		if(seachedDocuments.getSourceSystem() != null) {
			if(seachedDocuments.getSourceSystem().isEmpty()) 
				q.setParameter("sourceSystem", getSourceSystems());
			else
				q.setParameter("sourceSystem", seachedDocuments.getSourceSystem());
		}
		if(seachedDocuments.getDistributionMethod() != null)
			if(seachedDocuments.getDistributionMethod().isEmpty())
				q.setParameter("distributionMethod", getDistributionMethods());
			else	
				q.setParameter("distributionMethod", seachedDocuments.getDistributionMethod());
		if(seachedDocuments.getProcessedDateFrom() != null)
			try {
				q.setParameter("processedDateFrom", df.parse(seachedDocuments.getProcessedDateFrom()));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		if(seachedDocuments.getProcessedDateTo() != null)
			try {
				q.setParameter("processedDateTo", df.parse(seachedDocuments.getProcessedDateTo()));
			} catch (ParseException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		
		@SuppressWarnings("unchecked")
		List<OutboundDocument> outs = q.getResultList();
		System.out.println(outs);
		return outs;
	}

	@Override
	public List<String> getSourceSystems() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<String> outs = session.createQuery("select distinct O.sourceSystem from OutboundDocument O order by O.sourceSystem asc").getResultList();
		return outs;
	}

	@Override
	public List<String> getDistributionMethods() {
		Session session = sessionFactory.getCurrentSession();
		@SuppressWarnings("unchecked")
		List<String> outs = session.createQuery("select distinct O.distributionMethod from OutboundDocument O order by O.distributionMethod asc").getResultList();
		return outs;
	}

}
