const nav = document.getElementById('nav');
window.onscroll = function() {
	if (document.documentElement.scrollTop >= 200) {
		nav.classList.add("nav-scrolling");
		nav.classList.remove("nav-noScroll");
	}
	else {
		nav.classList.add("nav-noScroll");
		nav.classList.remove("nav-scrolling");
	}
};

// Hàm cuộn lên đầu trang
function scrollToTop() {
	window.scrollTo({
		top: 0,
		behavior: "smooth" // Tạo hiệu ứng cuộn mượt
	});
}