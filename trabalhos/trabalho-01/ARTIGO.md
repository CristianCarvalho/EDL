# Miranda



### Origens e influências



A linguagem Miranda é uma linguagem de paradigma funcional desenvolvida pelo Professor David Turner do Laboratório de Computação da Universidade de Kent Cantbury na Inglaterra. Miranda é uma evolução das SASL e KCR (também desenvolvidas pelo Prof.  David) usando alguns conceitos de Hope e ML. O projeto de Miranda foi desenvolvido no laboratório da Universidade de Kent na Inglaterra entre 1985 e 1986, mas está atualmente sob o domínio da empresa Researcher Software LTD. que se tornou dona na marca “Miranda”.  


**Curiosidade** 
Por que o nome Miranda?  

>Miranda é uma palavra latina que significa "de se admirar". Ele tem sido usado na Inglaterra e na América como um nome pessoal feminino desde o início do século XVII. Seu uso como primeira nome de uma menina é devido a Shakespeare, em The Tempest (1611). Em A Tempestade, Miranda é a filha do mago, Prospero. Ela vive em uma ilha encantada, protegido de todos os males do mundo (que, neste contexto, pode significar efeitos colaterais e outras características imperativas). No Ato 5, Cena 1 da trama, Miranda faz um discurso que contém as palavras (que mais tarde tornou-se famoso por Aldous Huxley, como o título de seu romance sobre o futuro): "O Admirável Mundo Novo".  
A ideia é que a linguagem Miranda é uma introdução ao Admirável Mundo Novo de programação funcional.  

### Classificação


Miranda foi criada para ser uma linguagem funcional mais atraente para o mercado e para o meio acadêmico, oferecendo conceitos antes não disponíveis em linguagens funcionais como abstração e polimorfismo. 
Mais usada no meio acadêmico que comercialmente, a programação funcional é um paradigma que trata a computação como uma avaliação de funções matemáticas e evita estados ou dados mutáveis. No entanto, mesmo dado seu caráter mais voltado para estudo, o paradigma funcional possui linguagens relevantes para a indústria, tais como:  Erlang, Mathematica e XSLT. Outras linguagens representantes do paradigma são Haskell, Lisp e Miranda, abordada neste trabalho.  

### Comparação com outras linguagens

Abaixo temos dois exemplos de códigos, um em Miranda e outro em C, onde cada um verifica se o número é primo.  



Código em Miranda

```sh

primes = sieve [2..]

sieve (p:x) = p : sieve [n | n <- x; n mod p ~= 0]

```

Código em C
  

```sh

#include <stdio.h>
int main (void) 

{
  int i, nb, contar, teste;

  teste = contar = 0;
  printf ("Entre um número inteiro : ");

  if (scanf ("%d", &nb) != 1)
 
    return -1;
  for (i = 2; i < nb; i++, contar++)
 
    if (nb % i == 0)
 
      teste = 1; 
  if (!teste)
 
    printf ("%d número primo, número iterações = %d\n", nb, contar);

  else
 
    printf ("%d não é um número primo, número iterações = %d\n", nb,contar);

  return 0;

} 

```
**Características (Miranda)**

- Fortemente tipado.

- funcional.

- Não restrito.

- características incomuns em linguagens funcionais (abstração, polimorfismo).  

### Conclusão
 
Miranda possui aplicações práticas principalmente no que diz respeito à prototipação rápida, ensinar programação funcional  e realizar pesquisas em programação funcional, bem como uma linguagem de especificação e uma ferramenta para programação em geral. Devido ao fato de Miranda não ser uma linguagem muito usada no mercado de software, há poucas aplicações escritas que possam ser encontradas na web.  
Serviu como base para a linguagem Haskell.

### Bibliografia

**Site oficial**  

http://www.miranda.org.uk/

**wikipedia**  

https://pt.wikipedia.org/wiki/Miranda_(linguagem_de_programa%C3%A7%C3%A3o)
