package edu.poly.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import edu.poly.model.User;

public class UserDao extends AbstracEntityDao<User> {

	public UserDao() {
		super(User.class);
	}

	public void changePassword(String username, String oldPassword, String newPassword) throws Exception {
		EntityManager em = JpaUtils.getEntityManager();

		EntityTransaction trans = em.getTransaction();

		String jpql = "select u From User u Where u.username = :username and u.password = :password";

		try {
			trans.begin();
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("password", oldPassword);
			User user = query.getSingleResult();
			if (user == null) {
				throw new Exception("Tên đăng nhập hoặc mật khẩu không chính xác!");
			} else {
				user.setPassword(newPassword);
				em.merge(user);
				trans.commit();
			}
		} catch (Exception e) {
			trans.rollback();
			throw e;
		} finally {
			em.close();
		}
	}
	
	public User findByUsernameAndEmail(String username,String email) {
		EntityManager em = JpaUtils.getEntityManager();
		String jpql = "select u From User u Where u.username = :username and u.email = :email";
		try {
			TypedQuery<User> query = em.createQuery(jpql, User.class);
			query.setParameter("username", username);
			query.setParameter("email", email);
			User user = query.getSingleResult();
			return user;
		} catch (Exception e) {
			throw e;
		}finally {
			em.close();
		}
	}
	
	public List<User> findUsersByPage(int pageNumber, int pageSize) {
		EntityManager em = JpaUtils.getEntityManager();
		List<User> list = null;
		try {
			TypedQuery<User> query = em.createQuery("SELECT u FROM User u", User.class);
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
}
