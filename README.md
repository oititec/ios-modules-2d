#  Liveness 2D para iOS

Neste repositório você vai encontrar as documentações para **iOS** sobre **FaceCaptcha** e **Documentoscopia**.

##  Instalação

O SDK está disponível via [CocoaPods](https://cocoapods.org/about) *(Forma recomendada)* ou via instalação manual.

###  CocoaPods
1. Caso não possua um arquivo `Podfile` no seu projeto, basta executar o comando abaixo na raiz do projeto que um novo arquivo desse será criado.

```rb
pod init
```

2. No início do `Podfile`, inclua a linha:

```rb
source 'https://github.com/oititec/ios-artifactory.git'
```

2. Após isso, adicione a dependência:

```rb
pod 'OILiveness2D', '~> x.y.z'
```

4. Execute o comando de instalação dos *pods*:
```rb
pod install
```

5. Abra o arquivo `.xcworkspace` do seu projeto.

###  Instalação manual

Os XCFramwworks para instalação manual estão disponíveis na pasta [Frameworks](/Frameworks).

##  Integração

###  Permissões de acesso

No `Info.plist` do projeto, adicione a descrição de uso de câmera (`Privacy - Camera Usage Description`).

![Info.plist Camera Permission](Documentation/Images/info_plist_camera_permission.jpg)

###  FaceCaptcha
As instruções de implementação do **FaceCaptcha** podem ser acessadas nos links abaixo:

  - [Descrição e Resultados](Documentation/FaceCaptcha/FaceCaptcha-Description.md);
  - [Fluxo de telas](Documentation/FaceCaptcha/FaceCaptcha-ScreensFlow.md);
  - [Guia de implementação](Documentation/FaceCaptcha/FaceCaptcha-Implementation.md);
  - [Guia de customização](Documentation/FaceCaptcha/FaceCaptcha-Customization.md).

###  Documentoscopia

As instruções de implementação da **Documentoscopia** podem ser acessadas nos links abaixo:

  - [Descrição e Resultados](Documentation/Documentscopy/Documentscopy-Description.md);
  - [Fluxo de telas](Documentation/Documentscopy/Documentscopy-ScreensFlow.md);
  - [Guia de implementação](Documentation/Documentscopy/Documentscopy-Implementation.md);
  - [Guia de customização](Documentation/Documentscopy/Documentscopy-Customization.md).

### Changelog
- Alterações a partir versão 1.0.0 podem ser encontradas [neste link](Documentation/MigrationGuide/Changelog/1.0.0.md).

### Breaking Changes
- [1.0.0](Documentation/MigrationGuide/BreakingChanges/1.0.0.md) - FaceCaptcha para OILiveness3D

<br/>

>⚠️ **Para conhecer mais sobre Liveness, consulte [este link.](https://certifaceid.readme.io/docs/liveness-detection-vs-atualizada)**

