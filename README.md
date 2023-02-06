#  Liveness 2D para iOS

Neste repositório você vai encontrar as documentações para **iOS** sobre **FaceCaptcha** e **Documentoscopia**.

## Sobre Este Repositório

O Liveness, ou Prova de Vida, pode ser executado através do **FaceCaptcha**. 

Os tipos de Liveness serão apresentados na demonstração do serviço e a escolha de um deles deve ser efetuada mediante contratação. Um diagnóstico será efetuado pelo time comercial, responsável por ofertar a melhor experiência para o cliente, considerando seu o modelo de negócio e o comportamento de seus usuários.

Para cada tipo de Liveness, são apresentados propriedades técnicas específicas. Assim, a pessoa desenvolvedora deve executar os comandos pertencentes ao tipo de serviço contratado.

Acompanhe abaixo a instalação, uso, guias de migração e outros documentos. Esses processos integram o projeto FaceCapctha.

##  Instalação

O SDK está disponível via [CocoaPods](https://cocoapods.org/) (*forma recomendada*).


####  CocoaPods

1. No início do `Podfile`, inclua a linha:

```rb
source 'https://github.com/oititec/ios-artifactory.git'
```

2. Após isso, adicione a dependência:

```rb
pod 'OILiveness2D', '~> 2.0.0'
```

3. Execute o comando `pod install`.

##  Uso

###  Permissões de acesso

No `Info.plist` do projeto, adicione a descrição de uso de câmera (`Privacy - Camera Usage Description`).

![Info.plist Camera Permission](Documentation/Images/info_plist_camera_permission.jpg)


###  FaceCaptcha
As instruções de implementação do **FaceCaptcha** podem ser acessadas nos links abaixo:

  - [Guia de implementação](Documentation/FaceCaptcha-Implementation.md);
  - [Guia de customização](Documentation/FaceCaptcha-Customization.md).


###  Documentoscopia

As instruções de implementação da **Documentoscopia** podem ser acessadas nos links abaixo:

  - [Guia de implementação](Documentation/Documentscopy-Implementation.md);
  - [Guia de customização](Documentation/Documentscopy-Customization.md).

>⚠️ **Para conhecer mais sobre Liveness, consulte [este link.](https://certifaceid.readme.io/docs/liveness-detection-vs-atualizada)**

