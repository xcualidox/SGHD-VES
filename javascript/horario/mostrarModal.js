function Mostrar(){
    const btn = document.getElementById('boton1');
    const btn2 = document.getElementById('boton2');
    const form = document.getElementById('form');
    const inputs= form.querySelectorAll('input');

    // 👇️ this CLEANS the form
    document.getElementById("ope").value = "";

    // Nota: el for está en -2 porque el queryselector se agarró todos los inputs del formulario, no se para que sirven las ultimas 2 pero se buguea feo si las vacío.
    for (let i = 0; i < inputs.length-2; i++) {
        inputs[i].value="";
      } 

    if (form.style.display === 'none') {
    // 👇️ this SHOWS the form
        form.style.display = 'block';
        btn2.style.display = 'block';
        btn.style.display = 'none';
    } else {
    // 👇️ this HIDES the form
        form.style.display = 'none';
        btn2.style.display = 'none';
        btn.style.display = 'block';
    }
}