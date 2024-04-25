package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.poly.domain.ShareReport;
import edu.poly.model.Share;

public class ShareDao extends AbstracEntityDao<Share>{

	public ShareDao() {
		super(Share.class);
	}
	
	public List<ShareReport> reportShareByVideo(String videoId) {
		String jpql = """
				SELECT new edu.poly.domain.ShareReport(s.user.fullName, s.user.email, s.emails, s.sharedDate)
				From Share s where s.video.videoId =:videoId
				""";
		EntityManager em = JpaUtils.getEntityManager();
		List<ShareReport> list = null;
		try {

			TypedQuery<ShareReport> query = em.createQuery(jpql, ShareReport.class);
			query.setParameter("videoId", videoId);
			list = query.getResultList();
		} finally {
			em.close();
		}

		return list;
	}
}
