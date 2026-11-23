const fechaNacimiento = document.getElementById('fecha_nac');
const esMayorDeEdadInput = document.getElementById('esMayorDeEdad'); // Referenciamos el campo oculto ya presente en el HTML

fechaNacimiento.addEventListener('input', () => {
    const fecha = new Date(fechaNacimiento.value);
    const hoy = new Date();

    const edad = hoy.getFullYear() - fecha.getFullYear();
    const mes = hoy.getMonth() - fecha.getMonth();
    const dia = hoy.getDate() - fecha.getDate();
    const edadReal = (mes < 0 || (mes === 0 && dia < 0)) ? edad - 1 : edad;

    // Si es mayor de edad (18 años o más), guardamos "true", si no, "false".
    const esMayorDeEdad = edadReal >= 18;
    esMayorDeEdadInput.value = esMayorDeEdad; // Actualizamos el valor del campo oculto
    // Verifica si el campo oculto se actualiza correctamente
    console.log("Valor de esMayorDeEdad:", esMayorDeEdad);
});