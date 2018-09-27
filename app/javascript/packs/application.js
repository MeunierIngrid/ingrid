// ############ page#home
$(document).ready(function(){
  $('.hover').hover(function(){
    $(this).addClass('flip');
  },function(){
    $(this).removeClass('flip');
  });
});

// ############ survey#new

// ajax radio_buton
const sessionButton = document.querySelector("#update-session");
const radios = document.querySelectorAll(".number");
radios.forEach((radio)=>{
  radio.addEventListener("click", (e)=>{
    e.preventDefault();
    sessionButton.href = `${sessionButton.innerText}?question_id=${e.currentTarget.dataset.qid}&score=${e.currentTarget.innerText}`;
    sessionButton.click();
  });
});

// sroll progress bar
$(document).on('scroll',function(){
  if ($(document).scrollTop() > 330) {
   $('#total-scores').addClass('fixed')
   $('#wrapper-after-progress-bar').addClass('margin-for-progress-bar-fixed')
  } else {
   $('#total-scores').removeClass('fixed')
   $('#wrapper-after-progress-bar').removeClass('margin-for-progress-bar-fixed')
  }
});

// ############ survey#show

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
