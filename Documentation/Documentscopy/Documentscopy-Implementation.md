# Guia de implementação - Documentoscopia

Guia de implementação da Documentoscopia para iOS.

## Instanciando o FaceCaptcha

1. Importe o módulo do `OILiveness2D` no arquivo onde ele será utilizado:
```swift
import OILiveness2D
```

2. Instancie `DocumentscopyViewController`, passando os seguintes parâmetros:
- **ticket** (_opcional_): Token para uso da Certiface API.
- **appKey**: App Key recebida previamente.
- **environment**: valor que indica o ambiente de execução desejado: <br/>- **HML**: Homologação<br/>- **PRD**: Produção.
- **delegate**: delegate que implementará os métodos para tratar o retorno da documentoscopia.

```swift
let controller = DocumentscopyViewController(
    ticket: ticket,
    appKey: appKey, 
    environment: environment,
    delegate: self
)
```

3. Apresente o controller instanciado:
```swift
controller.modalPresentationStyle = .fullScreen
present(controller, animated: true)
```

---

### Customização

Além de poder usar o SDK em sua forma padrão de exibição, é possível customizar o seu visual.

Detalhes de como implementar a customização são encontrados [neste link](Documentscopy-Customization.md).

---

### Tratando o retorno

1. Implemente o protocolo `DocumentscopyDelegate` para ser notificado sobre a conclusão da documentoscopia:
```swift
public protocol DocumentscopyDelegate: AnyObject {
    /// Lidar com o processo de Documentoscopia que foi realizado com sucesso.
    func handleDocumentscopyCompleted()
    
    /// Lidar com o erro que ocorreu durante o processo de Documentoscopia.
    /// - Parameter error: Erro capturado no processo.
    func handleDocumentscopyError(error: DocumentscopyError)
    
    /// Lidar com o processo de Documentoscopia que foi cancelado.
    func handleDocumentscopyCanceled()
}
```

Este protocolo contém três métodos:

- **handleDocumentscopyError**: método chamado em caso de falha, recebe um enum do tipo `DocumentscopyError`, que indica o erro ocorrido.
- **handleDocumentscopyCompleted**: método chamado em caso de envio de documento concluído com sucesso.
- **handleDocumentscopyCanceled**: método chamado se o usuário clicar no botão fechar/cancelar.

`DocumentscopyError` pode assumir os seguintes valores:
```swift
public enum DocumentscopyError {
    /// App Key inválido.
    case invalidAppKey

    /// Certiface offline.
    case certifaceOff

    /// Problema ao configurar a câmera
    case cameraSetupFailed

    /// Não foi concedida permissão de acesso à câmera do aparelho.
    case noCameraPermission

    /// Erro ao capturar foto
    case errorCapturePicture

    /// Sem conexão à Internet.
    case noInternetConnection

    /// Erro na requisição de validação dos desafios.
    case validationError
    
    /// FaceCaptcha não foi realizada
    case faceCaptchaNotExecuted
}
```
