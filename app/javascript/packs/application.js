

$('.target-chart').easyPieChart({
  animate: 1000,
  lineWidth: 12,
  scaleColor: false,
  size: 300,
  onStep: function(value) {
      this.$el.find('.target-percentage-number').text(Math.round(value));
  },
  onStop: function(value, to) {
      this.$el.find('.target-percentage-number').text(Math.round(to));
  },
  barColor: "#FF7826"
});
