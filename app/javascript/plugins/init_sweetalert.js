import swal from 'sweetalert';

const initSweetalert = (selector, options = {}, callback) => {
  const swalButton = document.querySelector(selector);
  console.log(swalButton)
  if (swalButton) { // protect other pages
    swalButton.addEventListener('click', () => {
      swal(options).then(callback);
    });
    // event.preventDefault();
  }
};

export { initSweetalert };
