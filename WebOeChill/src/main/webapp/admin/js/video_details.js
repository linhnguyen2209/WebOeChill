document.addEventListener('DOMContentLoaded', function() {
	const btnToggle = document.querySelector('.box__description button');
	const description = document.querySelector('.box__description small');

	btnToggle.addEventListener('click', function() {
		description.classList.toggle('show');
		description.classList.toggle('hidden');
		if (description.classList.contains('show')) {
			btnToggle.textContent = 'Ẩn bớt';
		} else {
			btnToggle.textContent = 'Hiển thị thêm';
		}
	});
});