window.onload = function () {


  var input = document.querySelector('#input');

  input.value = 'xxx';

  input.oninput = function () {
    console.log(this.value);
  }


}
