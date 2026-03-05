// =============================================
// MD. SHOBUJ — Portfolio JavaScript
// =============================================

/* ── Particles Canvas ── */
(function () {
  const canvas = document.getElementById('particles-canvas');
  const ctx = canvas.getContext('2d');
  let W, H, particles = [];

  function resize() {
    W = canvas.width  = window.innerWidth;
    H = canvas.height = window.innerHeight;
  }

  class Particle {
    constructor() { this.reset(); }
    reset() {
      this.x  = Math.random() * W;
      this.y  = Math.random() * H;
      this.r  = Math.random() * 1.8 + 0.4;
      this.vx = (Math.random() - 0.5) * 0.4;
      this.vy = (Math.random() - 0.5) * 0.4;
      this.life = Math.random();
      this.maxLife = Math.random() * 0.6 + 0.4;
      this.color = ['#6c63ff','#ff6584','#43e97b'][Math.floor(Math.random()*3)];
    }
    update() {
      this.x += this.vx;
      this.y += this.vy;
      this.life += 0.003;
      if (this.life > this.maxLife || this.x < 0 || this.x > W || this.y < 0 || this.y > H) this.reset();
    }
    draw() {
      const alpha = Math.sin((this.life / this.maxLife) * Math.PI) * 0.7;
      ctx.beginPath();
      ctx.arc(this.x, this.y, this.r, 0, Math.PI * 2);
      // Convert alpha (0–1) to a two-digit hex suffix for the colour string
      ctx.fillStyle = this.color + (Math.round(alpha * 255) | 0).toString(16).padStart(2, '0');
      ctx.fill();
    }
  }

  // Draw connections between nearby particles
  function drawConnections() {
    for (let i = 0; i < particles.length; i++) {
      for (let j = i + 1; j < particles.length; j++) {
        const dx = particles[i].x - particles[j].x;
        const dy = particles[i].y - particles[j].y;
        const dist = Math.sqrt(dx * dx + dy * dy);
        if (dist < 120) {
          ctx.beginPath();
          ctx.moveTo(particles[i].x, particles[i].y);
          ctx.lineTo(particles[j].x, particles[j].y);
          ctx.strokeStyle = `rgba(108,99,255,${(1 - dist / 120) * 0.12})`;
          ctx.lineWidth = 0.5;
          ctx.stroke();
        }
      }
    }
  }

  function animate() {
    ctx.clearRect(0, 0, W, H);
    drawConnections();
    particles.forEach(p => { p.update(); p.draw(); });
    requestAnimationFrame(animate);
  }

  window.addEventListener('resize', resize);
  resize();
  for (let i = 0; i < 100; i++) particles.push(new Particle());
  animate();
})();

/* ── Typing Animation ── */
(function () {
  const roles = [
    'Flutter Developer',
    'Mobile App Engineer',
    'Competitive Programmer',
    'CS Researcher',
    'Open-Source Enthusiast'
  ];
  const el = document.getElementById('typing-text');
  let ri = 0, ci = 0, deleting = false;

  function type() {
    const word = roles[ri];
    if (!deleting) {
      el.textContent = word.substring(0, ci + 1);
      ci++;
      if (ci === word.length) {
        deleting = true;
        setTimeout(type, 1800);
        return;
      }
    } else {
      el.textContent = word.substring(0, ci - 1);
      ci--;
      if (ci === 0) {
        deleting = false;
        ri = (ri + 1) % roles.length;
      }
    }
    setTimeout(type, deleting ? 60 : 90);
  }
  type();
})();

/* ── Scroll Reveal ── */
(function () {
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(e => {
      if (e.isIntersecting) {
        e.target.classList.add('visible');
        observer.unobserve(e.target);
      }
    });
  }, { threshold: 0.12, rootMargin: '0px 0px -40px 0px' });

  document.querySelectorAll(
    '.reveal, .timeline-item, .project-card, .skill-category, ' +
    '.cp-card, .list-card, .stat-item, .thesis-card'
  ).forEach(el => observer.observe(el));
})();

/* ── Counter Animation ── */
(function () {
  const counters = document.querySelectorAll('[data-count]');
  const observer = new IntersectionObserver((entries) => {
    entries.forEach(e => {
      if (!e.isIntersecting) return;
      const el = e.target;
      const target = parseInt(el.dataset.count, 10);
      const suffix = el.dataset.suffix || '';
      let start = 0;
      const duration = 1500;
      const step = (timestamp) => {
        if (!start) start = timestamp;
        const progress = Math.min((timestamp - start) / duration, 1);
        const eased = 1 - Math.pow(1 - progress, 3);
        el.textContent = Math.round(eased * target) + suffix;
        if (progress < 1) requestAnimationFrame(step);
      };
      requestAnimationFrame(step);
      observer.unobserve(el);
    });
  }, { threshold: 0.5 });

  counters.forEach(c => observer.observe(c));
})();

/* ── Hamburger Menu ── */
(function () {
  const hamburger = document.querySelector('.hamburger');
  const navLinks = document.querySelector('.nav-links');
  hamburger.addEventListener('click', () => {
    navLinks.classList.toggle('open');
  });
  navLinks.querySelectorAll('a').forEach(a => {
    a.addEventListener('click', () => navLinks.classList.remove('open'));
  });
})();

/* ── Nav scroll shrink ── */
(function () {
  const nav = document.querySelector('nav');
  window.addEventListener('scroll', () => {
    if (window.scrollY > 60) {
      nav.style.padding = '0.6rem 2rem';
    } else {
      nav.style.padding = '1rem 2rem';
    }
  });
})();

/* ── Active nav link highlight ── */
(function () {
  const sections = document.querySelectorAll('section[id]');
  const links = document.querySelectorAll('.nav-links a[href^="#"]');

  window.addEventListener('scroll', () => {
    let current = '';
    sections.forEach(sec => {
      const top = sec.offsetTop - 100;
      if (window.scrollY >= top) current = sec.id;
    });
    links.forEach(link => {
      link.style.color = link.getAttribute('href') === '#' + current
        ? 'var(--primary)'
        : '';
    });
  });
})();

/* ── Mouse parallax for orbs ── */
(function () {
  const orbs = document.querySelectorAll('.orb');
  window.addEventListener('mousemove', (e) => {
    const cx = e.clientX / window.innerWidth - 0.5;
    const cy = e.clientY / window.innerHeight - 0.5;
    orbs.forEach((orb, i) => {
      const strength = (i + 1) * 18;
      orb.style.transform = `translate(${cx * strength}px, ${cy * strength}px)`;
    });
  });
})();
