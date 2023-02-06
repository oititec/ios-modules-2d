# Liveness - Prova de Vida

Guia de implementação do FaceCaptcha para iOS.

### Instanciando o FaceCaptcha

1. Importe o módulo do `OILiveness2D` no arquivo onde ele será utilizado:
```swift
import OILiveness2D
```

2. Instancie `FaceCaptchaViewController`, passando os seguintes parâmetros:
- *appKey*: App Key recebida previamente.
- *baseURL*: URL apontando para o ambiente desejado.
- *delegate* *(opcional)*: delegate que implementará os métodos para tratar o retorno do FaceCaptcha.

```swift
let controller = FaceCaptchaViewController(
    appKey: appKey,
    baseURL: baseURL,
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

Detalhes de como implementar a customização são encontrados [neste link](FaceCaptcha-Customization.md).

---

### Tratando o retorno

1. Implemente o protocolo `FaceCaptchaDelegate` para ser notificado sobre a conclusão da prova de vida:

```swift
public protocol FaceCaptchaDelegate: AnyObject {
    func handleSuccess(model: FaceCaptchaSuccessModel)
    func handleError(error: FaceCaptchaError)
    func handleCanceled()
}
```

Este protocolo contém três métodos:

- *handleSuccess*: recebe um objeto do tipo `FaceCaptchaSuccessModel`, no qual é possível verificar se a prova de vida foi válida, e, caso não tenha sido, o motivo pelo qual falhou.
- *handleError*: recebe um enum do tipo `FaceCaptchaError`, que indica o erro ocorrido.
- *handleCanceled*: método chamado se o usuário clicar nos botões de fechar ou cancelar.

<br/>

`FaceCaptchaError` pode assumir os seguintes valores:

```swift
/// Erros que podem ser retornados pelo FaceCaptcha.
public enum FaceCaptchaError {
    /// App Key inválido.
    case invalidAppKey
    /// Certiface offline.
    case certifaceOff
    /// Não foi concedida permissão de acesso à câmera do aparelho.
    case noCameraPermission
    /// Sem conexão à Internet.
    case noInternetConnection
    /// Chamada telefônica em andamento. Não é possível iniciar o desafio durante uma chamada telefônica.
    case phoneCallInProgress
    /// Erro na requisição de validação dos desafios.
    case validationError
    /// App foi minimizado durante o uso do FaceCaptcha, isso faz com que o desafio seja encerrado.
    case challengeInterrupted
    /// Erro inesperado em algum request
    case requestError
    /// Falha em configurar câmera
    case errorCameraSetup
    /// Erro ao capturar foto
    case errorCapturePicture
}
```
