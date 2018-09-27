const run = () => {
  const circles = document.querySelectorAll('.js-circle')
  circles.forEach((circle) => {
    const radius = circle.getAttribute('r')
    const val = circle.getAttribute('score')
    const diameter = Math.round(Math.PI * radius * 2)
    circle.style.strokeDashoffset = Math.round(1100 - diameter * val / 100)
  })
}

document.addEventListener('DOMContentLoaded', () => setTimeout(run, 10))
