# Guia de migração - 1.0.0
Guia de migração do SDK iOS para versões acima da versão 1.0.0 e anterior a versão 2.0.0.

Essa primeira versão faz parte da modularização do antigo módulo único (FaceCaptcha), onde nesse repositório se encontra isolado os módulo de FaceCaptcha e Documentoscopia.

## Mudanças

### FaceCaptcha

1. O *layout* e fluxo de telas foram atualizados. [Fluxo de telas](../../FaceCaptcha/FaceCaptcha-ScreensFlow.md)

2. As assinaturas dos métodos do protocolo `FaceCaptchaDelegate` foram alteradas. [Guia de implementação](../../FaceCaptcha/FaceCaptcha-Implementation.md)

3. Os parâmetros `cameraOverlay` e `customView` da classe `FaceCaptchaViewController` foram removidos.

4. Foram adicionados novos protocolos para customização das telas do fluxo.

5. O protocolo `FaceCaptchaView` mudou para `FaceCaptchaCustomView`.

6. Houveram alterações nas propriedades e métodos do protocolo `FaceCaptchaCustomView` (antigo `FaceCaptchaView`):

| **Nome antigo**        | **Novo nome**    | **Novo Tipo**                 |
| :--------------------- | :--------------- | :---------------------------- |
| cameraContainer        | cameraPreview    | ***                           |
| initialInstructionView | instructionLabel | UILabel!                      |
| activityIndicatorView  | recognizingLabel | UILabel!                      |
| ***                    | cameraOverlay    | UIView!                       |
| ***                    | backButton       | UIButton!                     |
| ***                    | progressView     | UIView!                       |

**Métodos adicionados**
- updateProgress(to:)
- setInstructionLabelTitle(to:)

**Propriedades removidas**
- challengeContainer

> Os tópicos de 3 a 6 podem ser consultados no [Guia de customização](../../FaceCaptcha/FaceCaptcha-Customization.md)

### Documentoscopia

1. O parâmetro `customCameraPermissionView` do inicializador da `DocumentscopyViewController` mudou de posição.

2. A assinatura do tipo ``DocumentscopyCustomCameraPermissionView`` mudou para ``CustomCameraPermissionView``. 

3. A assinatura dos tipos ``LoadingVisibility`` e ``DocumentscopyConfirmationSheetVisibility`` mudou para ``Visibility``.

4. A partir dessa versão a implementação do método `changeLoadingVisibility(to:)` do protocolo ``DocumentscopyCustomInstructionView`` é obrigatória.

5. A assinatura do tipo ``DocumentscopyCameraPreviewView`` mudou para ``CameraPreviewView``.

6. O tipo ``DocumentscopyFocusIndicator`` foi substituído pelo ``FocusIndicator``.

> Todas as alterações na Documentoscopia podem ser encontradas no [Guia de customização](../../Documentscopy/Documentscopy-Customization.md).