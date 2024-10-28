# Changelog

## [versão 2.4.0](https://github.com/oititec/ios-modules-2d/releases/tag/2.4.0)
_data: 23/10/2024_

- **Melhorias**
    - Integração com o Sentry (**OISecurity - 4.0.0**).
    - Devido a atualização do módulo de **OISecurity** para versão `4.0.0`, o módulo de **OILiveness3D** (_caso esteja implementado_) precisa ser atualizado para versão `2.3.0`.

## [versão 2.3.1](https://github.com/oititec/ios-modules-2d/releases/tag/2.3.1)
_data: 02/09/2024_

- **Melhorias**
    - Correção da duplicidade de desafios no `FaceCaptcha`.

## [versão 2.3.0](https://github.com/oititec/ios-modules-2d/releases/tag/2.3.0)
_data: 05/07/2024_

- **Melhorias**
    - Adição da propriedade `showFeedback` no `FaceCaptcha` e `Documentscopy`.

## [versão 2.2.0](https://github.com/oititec/ios-modules-2d/releases/tag/2.2.0)
_data: 25/06/2024_

- **Melhorias**
    - Ajustes no layout da `DocCore`.
    - Correção de bugs.

## [versão 2.1.3](https://github.com/oititec/ios-modules-2d/releases/tag/2.1.3)
_data: 13/05/2024_

- **Melhorias**
    - Conformidade com as novas diretrizes da App Store.

## [versão 2.1.2](https://github.com/oititec/ios-modules-2d/releases/tag/2.1.2)
_data: 29/04/2024_

- **Melhorias**
    - Remoção do **CallKit** Framework.

## [versão 2.1.1](https://github.com/oititec/ios-modules-2d/releases/tag/2.1.1)
_data: 03/04/2024_

- **Melhorias**
    - Atualização da versão mínima de suporte para **iOS 12.0**.

## [versão 2.1.0](https://github.com/oititec/ios-modules-2d/releases/tag/2.1.0)
_data: 12/03/2024_

- **Melhorias**
    - Ajustes nos objetos de customização focados no desenvolvimento híbrido.

## [versão 2.0.0](https://github.com/oititec/ios-modules-2d/releases/tag/2.0.0)
_data: 01/02/2024_

- **Breaking Changes no FaceCaptcha**
    - O protocolo `DocumentscopyCustomInstructionView` foi atualizado. 
      - `continueButton` entrou no lugar das propriedades `viewCNH` e `viewRG`.
  
    Veja mais detalhes [nesse link](https://devcenter.certiface.io/docs/customizacao-doccore-ios#1-tela-inicial)

## [versão 1.3.0](https://github.com/oititec/ios-modules-2d/releases/tag/1.3.0)
_data: 28/12/2023_

- **Melhorias**
    - Adicionada a funcionalidade de Device Intelligence.
    - **Necessário incluir a permissão de localização**: seguir as instruções de permissionamento disponíveis [neste link](https://devcenter.certiface.io/docs/guia-de-instalacao-ios#permiss%C3%B5es-de-acesso).

## [versão 1.2.2](https://github.com/oititec/ios-modules-2d/releases/tag/1.2.2)
_data: 07/11/2023_

- **Melhorias**
    - Corrigido o desfoque na captura de documento em dispositivos com três câmeras.
    - Corrigidas as propriedades do `DocumentscopyCustomizationBuilder` que não estavam sendo aplicadas.

## [versão 1.2.1](https://github.com/oititec/ios-modules-2d/releases/tag/1.2.1)
_data: 15/10/2023_

- **Melhorias**
    - Corrigido os símbolos de depuração para simulador.

## [versão 1.2.0](https://github.com/oititec/ios-modules-2d/releases/tag/1.2.0)
_data: 05/10/2023_

- **Melhorias**
    - Adicionado um novo objeto de customização (_opcional_) para DocCore no inicializador da classe `DocumentscopyViewController`.

## [versão 1.1.1](https://github.com/oititec/ios-modules-2d/releases/tag/1.1.1)
_data: 06/09/2023_

- **Melhorias**
    - Alterações no método de distribuição do módulo.

## [versão 1.1.0](https://github.com/oititec/ios-modules-2d/releases/tag/1.1.0)
_data: 08/08/2023_

- **Melhorias**
    - Adicionado o parâmetro ticket (_opcional_) no inicializador da classe `DocumentscopyViewController` para uso da Certiface API.

## [versão 1.0.0](https://github.com/oititec/ios-modules-2d/releases/tag/1.0.0)
_data: 07/07/2023_

- **Breaking Changes no FaceCaptcha**
    - O *layout* e fluxo de telas foram atualizados. [Fluxo de telas](../../FaceCaptcha/FaceCaptcha-ScreensFlow.md)
    - As assinaturas dos métodos do protocolo `FaceCaptchaDelegate` foram alteradas. [Guia de implementação](../../FaceCaptcha/FaceCaptcha-Implementation.md)
    - Os parâmetros `cameraOverlay` e `customView` da classe `FaceCaptchaViewController` foram removidos. [Guia de customização](../../FaceCaptcha/FaceCaptcha-Customization.md)
    - Foram adicionados novos protocolos para customização das telas do fluxo. [Guia de customização](../../FaceCaptcha/FaceCaptcha-Customization.md)
    - O protocolo `FaceCaptchaView` mudou para `FaceCaptchaCustomView`. [Guia de customização](../../FaceCaptcha/FaceCaptcha-Customization.md)
    - Houveram alterações nas propriedades e métodos do protocolo `FaceCaptchaCustomView` (antigo `FaceCaptchaView`). [Guia de customização](../../FaceCaptcha/FaceCaptcha-Customization.md)

- **Breaking Changes na Documentoscopia**
    - O parâmetro `customCameraPermissionView` do inicializador da `DocumentscopyViewController` mudou de posição. [Guia de customização](../../Documentscopy/Documentscopy-Customization.md)
    - A assinatura do tipo ``DocumentscopyCustomCameraPermissionView`` mudou para ``CustomCameraPermissionView``. [Guia de customização](../../Documentscopy/Documentscopy-Customization.md)
    - A assinatura dos tipos ``LoadingVisibility`` e ``DocumentscopyConfirmationSheetVisibility`` mudou para ``Visibility``. [Guia de customização](../../Documentscopy/Documentscopy-Customization.md)
    - A partir dessa versão a implementação do método `changeLoadingVisibility(to:)` do protocolo ``DocumentscopyCustomInstructionView`` é obrigatória. [Guia de customização](../../Documentscopy/Documentscopy-Customization.md)
    - A assinatura do tipo ``DocumentscopyCameraPreviewView`` mudou para ``CameraPreviewView``. [Guia de customização](../../Documentscopy/Documentscopy-Customization.md)
    - O tipo ``DocumentscopyFocusIndicator`` foi substituído pelo ``FocusIndicator``. [Guia de customização](../../Documentscopy/Documentscopy-Customization.md)
