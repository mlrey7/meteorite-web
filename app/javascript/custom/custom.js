
document.addEventListener("turbolinks:load", function () {
  document.querySelectorAll('.micropost_picture').forEach(item => {
    var label = item.nextElementSibling,
      labelVal = label.innerHTML;

    item.addEventListener('change', function (event) {
      var fileName = ' ';
      fileName = event.target.value.split("\\").pop();

      if (fileName)
        label.innerHTML = fileName;
      else
        label.innerHTML = labelVal;
    })
  })
});
