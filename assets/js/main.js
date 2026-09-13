// Small progressive enhancements. The site works fine without this file.
(function () {
  'use strict';

  // Current year in the footer.
  document.querySelectorAll('[data-year]').forEach(function (el) {
    el.textContent = String(new Date().getFullYear());
  });

  // Mobile nav toggle.
  var toggle = document.querySelector('.nav-toggle');
  var nav = document.getElementById('nav');
  if (toggle && nav) {
    toggle.addEventListener('click', function () {
      var open = nav.classList.toggle('open');
      toggle.setAttribute('aria-expanded', String(open));
    });
  }

  // Contact form: until a real endpoint is wired up, keep the visitor informed
  // instead of silently reloading the page.
  var form = document.querySelector('.form');
  var note = document.querySelector('[data-form-note]');
  if (form && note) {
    form.addEventListener('submit', function (event) {
      var action = form.getAttribute('action');
      if (action && action !== '#') return; // real endpoint configured

      event.preventDefault();
      if (!form.checkValidity()) {
        note.textContent = 'Please fill in every field before sending.';
        note.hidden = false;
        return;
      }
      note.textContent =
        'This form is not connected yet — please email hello@example.com for now.';
      note.hidden = false;
    });
  }
})();
