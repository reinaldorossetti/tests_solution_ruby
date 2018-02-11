#language: pt
#encoding: utf-8

Funcionalidade: Enviando dados em Áudio e Imagens pelo Whatsapp.

  Contexto: Efetuando login na aplicacao no Whatsapp.
    Dado que o usuário esteja no aplicativo de Whatsapp.

  Cenario: O usuário enviando um Áudio no Whatsapp.
    Quando O usuário escolher um contato.
    E Deve selecionar o botao de Áudio.
     E Após alguns segundos enviar. 
    Então O Áudio deve ser enviado com sucesso.

  Cenario: O usuário enviando um Emoji no Whatsapp.
    Quando O usuário escolher um contato.
    E Deve Procurar um Emoji.
     E Após selecionar o Emoji enviar o mesmo. 
    Então O Emoji deve ser enviado com sucesso.

  Cenario: O usuário enviando um GIF no Whatsapp.
    Quando O usuário escolher um contato.
    E Deve Procurar um GIF.
     E Após selecionar o GIF enviar o mesmo. 
    Então O GIF deve ser enviado com sucesso.