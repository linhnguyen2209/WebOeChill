package edu.poly.dao;

import java.util.Collections;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;

import edu.poly.domain.VideoFull;
import edu.poly.model.Video;

public class VideoDao extends AbstracEntityDao<Video> {

	public VideoDao() {
		super(Video.class);
	}

	public List<VideoFull> findVideoFullByPage(int pageNumber, int pageSize, String username) {
		String jpql = "SELECT NEW edu.poly.domain.VideoFull("
				+ "v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views, "
				+ "SUM(CASE WHEN f.user.username = :username THEN true ELSE false END), " + // Use > 0 for liked
				"SUM(CASE WHEN r.user.username = :username THEN true ELSE false END), " + // Use > 0 for rated
				"COUNT(r),1) " + // Calculate reviewCount using COUNT
				"FROM Video v " + "LEFT JOIN v.favourites f " + "LEFT JOIN v.ratings r "
				+ "GROUP BY v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views "
				+ "ORDER BY v.videoId DESC";

		EntityManager em = JpaUtils.getEntityManager();
		List<VideoFull> list = null;

		try {
			TypedQuery<VideoFull> query = em.createQuery(jpql, VideoFull.class);
			query.setParameter("username", username);
			query.setFirstResult((pageNumber - 1) * pageSize);
			query.setMaxResults(pageSize);

			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

		return list;
	}

	public List<VideoFull> findFavouriteVideoFullByPage(int pageNumber, int pageSize, String username) {
		String jpql = "SELECT NEW edu.poly.domain.VideoFull("
				+ "v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views, "
				+ "true, " + // Set liked to true since we are querying favourites
				"SUM(CASE WHEN r.user.username = :username THEN true ELSE false END), " + // Use > 0 for rated
				"COUNT(r),1) " + // Calculate reviewCount using COUNT
				"FROM Video v " + "JOIN v.favourites f " + "LEFT JOIN v.ratings r "
				+ "WHERE f.user.username = :username "
				+ "GROUP BY v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views "
				+ "ORDER BY v.videoId DESC";

		EntityManager em = JpaUtils.getEntityManager();
		List<VideoFull> list = null;

		try {
			TypedQuery<VideoFull> query = em.createQuery(jpql, VideoFull.class);
			query.setParameter("username", username);
			query.setFirstResult((pageNumber - 1) * pageSize);
			query.setMaxResults(pageSize);

			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

		return list;
	}

	public List<VideoFull> findVideoFullForSlide(int pageSize, String username) {
		String jpql = "SELECT NEW edu.poly.domain.VideoFull("
				+ "v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views, "
				+ "SUM(CASE WHEN f.user.username = :username THEN true ELSE false END), " + // Use > 0 for liked
				"SUM(CASE WHEN r.user.username = :username THEN true ELSE false END), " + // Use > 0 for rated
				"COUNT(r),1) " + // Calculate reviewCount using COUNT
				"FROM Video v " + "LEFT JOIN v.favourites f " + "LEFT JOIN v.ratings r "
				+ "GROUP BY v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views "
				+ "ORDER BY v.videoId ASC";

		EntityManager em = JpaUtils.getEntityManager();
		List<VideoFull> list = null;

		try {
			TypedQuery<VideoFull> query = em.createQuery(jpql, VideoFull.class);
			query.setParameter("username", username);
			// lấy 6 video đầu tiên
			query.setFirstResult(0);
			query.setMaxResults(pageSize);

			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

		return list;
	}

	public VideoFull findVideoFullById(String videoId, String username) {
		String jpql = "SELECT NEW edu.poly.domain.VideoFull("
				+ "v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views, "
				+ "SUM(CASE WHEN f.user.username = :username THEN true ELSE false END), " // Use > 0 for liked
				+ "SUM(CASE WHEN r.user.username = :username THEN true ELSE false END), " // Use > 0 for rated
				+ "COUNT(r), 1) " // Calculate reviewCount using COUNT
				+ "FROM Video v " + "LEFT JOIN v.favourites f " + "LEFT JOIN v.ratings r "
				+ "WHERE v.videoId = :videoId "
				+ "GROUP BY v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views "
				+ "ORDER BY v.videoId DESC";

		EntityManager em = JpaUtils.getEntityManager();
		List<VideoFull> list = null;
		try {
			TypedQuery<VideoFull> query = em.createQuery(jpql, VideoFull.class);
			query.setParameter("videoId", videoId);
			query.setParameter("username", username);

			list = query.getResultList(); // Expecting only one result since querying by videoId

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

		return list.get(0);
	}

	public List<VideoFull> findVideoFullBySearchValue(String username, String valueSearch) {
	    String jpql = "SELECT NEW edu.poly.domain.VideoFull("
	            + "v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views, "
	            + "SUM(CASE WHEN f.user.username = :username THEN true ELSE false END), " // Use > 0 for liked
	            + "SUM(CASE WHEN r.user.username = :username THEN true ELSE false END), " // Use > 0 for rated
	            + "COUNT(r), 1) " // Calculate reviewCount using COUNT
	            + "FROM Video v "
	            + "LEFT JOIN v.favourites f "
	            + "LEFT JOIN v.ratings r "
	            + "WHERE v.title LIKE CONCAT('%', :valueSearch, '%') " // Search by title
	            + "GROUP BY v.videoId, v.active, v.description, v.duration, v.genre, v.poster, v.title, v.videoLink, v.views "
	            + "ORDER BY v.videoId ASC";

	    EntityManager em = JpaUtils.getEntityManager();
	    List<VideoFull> list = null;

	    try {
	        TypedQuery<VideoFull> query = em.createQuery(jpql, VideoFull.class);
	        query.setParameter("username", username);
	        query.setParameter("valueSearch", valueSearch); // Set valueSearch parameter

	        list = query.getResultList();
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        em.close();
	    }

	    return list;
	}

	
	public List<Video> findVideosByPage(int pageNumber, int pageSize) {
		EntityManager em = JpaUtils.getEntityManager();
		List<Video> list = null;
		try {
			TypedQuery<Video> query = em.createQuery("SELECT v FROM Video v", Video.class);
			query.setFirstResult((pageNumber - 1) * pageSize); // như này thì sẽ bỏ qua được số hàng của trang đầu và
																// hiển thị cho trang tiếp theo
			query.setMaxResults(pageSize);
			list = query.getResultList();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			em.close();
		}

		return list;
	}

//	public List<Video> findRandomVideos(int count) {
//		EntityManager em = JpaUtils.getEntityManager();
//		List<Video> list = null;
//		try {
//			TypedQuery<Video> query = em.createQuery("SELECT v FROM Video v ORDER BY FUNCTION('RAND')", Video.class);
//			query.setMaxResults(count);
//			list = query.getResultList();
//		} catch (Exception e) {
//			e.printStackTrace();
//		} finally {
//			em.close();
//		}
//		return list;
//	}
}
