window.addEventListener('scroll', function() {
  const navbar = document.getElementById('navbar');
  
  // Se o usuário rolar mais do que 50 pixels para baixo
  if (window.scrollY > 50) {
    navbar.classList.add('scrolled'); // Adiciona a classe que diminui a logo
  } else {
    navbar.classList.remove('scrolled'); // Remove a classe e a logo volta ao normal
  }
});
const carrossel = document.getElementById('meu-carrossel');
const btnPrev = document.getElementById('btn-prev');
const btnNext = document.getElementById('btn-next');

let index = 0;
const totalImagens = carrossel.children.length;

// Função que move o carrossel para a imagem correta
function atualizarCarrossel() {
    const larguraImagem = carrossel.clientWidth;
    carrossel.scrollTo({
        left: index * larguraImagem,
        behavior: 'smooth'
    });
}

// Avançar imagem
function avancarImagem() {
    index++;
    if (index >= totalImagens) {
        index = 0; // Volta para a primeira foto se passar da última
    }
    atualizarCarrossel();
}

// Voltar imagem
function voltarImagem() {
    index--;
    if (index < 0) {
        index = totalImagens - 1; // Vai para a última se voltar antes da primeira
    }
    atualizarCarrossel();
}


btnNext.addEventListener('click', () => {
    avancarImagem();
    reiniciarTemporizador(); // Reseta o tempo se o usuário clicar manualmente
});

btnPrev.addEventListener('click', () => {
    voltarImagem();
    reiniciarTemporizador(); // Reseta o tempo se o usuário clicar manualmente
});


// Muda de imagem a cada 3000 milissegundos (3 segundos)
let tempoAuto = setInterval(avancarImagem, 3000); 

function reiniciarTemporizador() {
    clearInterval(tempoAuto); // Para o tempo antigo
    tempoAuto = setInterval(avancarImagem, 3000); // Inicia um novo do zero
}