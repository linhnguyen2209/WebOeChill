package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.poly.domain.FavouriteReport;
import edu.poly.domain.FavouriteUserReport;
import edu.poly.model.Favourite;

public class FavouriteDao extends AbstracEntityDao<Favourite> {

	public FavouriteDao() {
		super(Favourite.class);
	}

	// Báo cáo những người dùng yêu thích bằng video
	public List<FavouriteUserReport> reportFavouriteUsersByVideo(String videoId) {
		String jpql = """
				SELECT new edu.poly.domain.FavouriteUserReport(f.user.username,f.user.fullName,f.user.email,f.likedDate)
				From Favourite f where f.video.videoId =:videoId
				""";
		EntityManager em = JpaUtils.getEntityManager();
		List<FavouriteUserReport> list = null;
		try {

			TypedQuery<FavouriteUserReport> query = em.createQuery(jpql, FavouriteUserReport.class);
			query.setParameter("videoId", videoId);
			list = query.getResultList();
		} finally {
			em.close();
		}

		return list;
	}

	// Báo cáo về yêu thích của từng video
	public List<FavouriteReport> reportFavouriteOfVideos() {
		String jpql = """
				SELECT new edu.poly.domain.FavouriteReport(f.video.title,count(f), min(f.likedDate),max(f.likedDate))
				From Favourite f GROUP BY f.video.title
				""";
		EntityManager em = JpaUtils.getEntityManager();
		try {
			TypedQuery<FavouriteReport> query = em.createQuery(jpql, FavouriteReport.class);
			return query.getResultList();
		} finally {
			em.close();
		}

	}

	// Báo cáo về yêu thích của từng video
	public Favourite findFavouriteByVideoIdAndUser(String videoId, String username) {
		String jpql = """
				Select f from Favourite f Where f.video.videoId = :videoId and f.user.username =:username
				""";
		EntityManager em = JpaUtils.getEntityManager();
		try {
			TypedQuery<Favourite> query = em.createQuery(jpql, Favourite.class);
			query.setParameter("videoId", videoId);
			query.setParameter("username", username);
		
			List<Favourite> favourites = query.getResultList();

			// phải dùng list chứ không dùng single sẽ bị lỗi nếu null
			if (!favourites.isEmpty()) {
			    return favourites.get(0); // Trả về bản ghi đầu tiên trong danh sách
			} else {
			    return null; // Trả về null nếu không tìm thấy bản ghi
			}
		} finally {
			em.close();
		}

	}
}
