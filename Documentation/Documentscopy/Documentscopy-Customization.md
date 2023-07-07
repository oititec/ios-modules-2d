# Guia de customização - Documentoscopia 
Saiba como implementar a customização de views (telas), conforme a sua necessidade.

Você pode utilizar o SDK padrão e por meio dele, também customizar a visualização dessas telas.

## Configuração das telas customizáveis

A customização das telas é semelhante ao **Liveness**. Ela é feita por meio da criação de objetos do tipo `UIView`(_via código ou via Interface Builder_), que implementem os protocolos definidos para cada tela.

Além das subviews especificadas, a view customizada pode conter outros elementos, apenas tomando cuidado para que os mesmos não interfiram nas subviews funcionais.

Para realizar essa implementação é necessário seguir alguns protocolos, para o funcionamento correto do processo de **documentoscopia**. 
Veja a seguir:

### Implementação

Todas as *views* customizadas são passadas via construtor da classe ``DocumentscopyViewController``. Essas *views* são opcionais, logo não há necessidade de especificar todas, caso não seja necessário.

```swift
let controller = DocumentscopyViewController(
    appKey: appKey, 
    environment: environment, 
    delegate: self,
    customInstructionView: CustomInstructionView(),
    customView: CustomView(),
    customLoadingView: CustomLoadingView(),
    customResultView: CustomResultView(),
    customCameraPermissionView: CustomCameraPermissionView()
)

```
**Caso qualquer um seja `nil`, será usado o *layout* padrão.**

---

## 1. Tela inicial

### `customInstructionView`
Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomInstructionView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomInstructionView: UIView {
    var backButton: UIButton! { get }
    var viewCNH: UIView! { get }
    var viewRG: UIView! { get }

    func changeLoadingVisibility(to visibility: Visibility)
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `backButton` | Botão para função voltar da navegação. |
| (**2**) | `viewCNH` | View que terá a ação de iniciar o fluxo de captura do documento CNH. |
| (**3**) | `viewRG` | View que terá a ação de iniciar o fluxo de captura do documento RG. |
|         | `changeLoadingVisibility(to:)` | Método responsável por indicar o estado do _loading_ na tela de instruções, podendo receber dois valores:<br/>- **hidden** (_esconder o loading_)<br/>- **displayed** (_mostrar o loading_). |

<br/>
<img src="../Images/Documentscopy/dc_instructions.png" width="432" height="396" />

---

## 2. Tela de captura do documento

### `customView`
Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomView: UIView {
    var cameraPreview: CameraPreviewView! { get }    
    var cameraMask: UIView! { get }
    var backButton: UIButton! { get }
    var closeButton: UIButton! { get }    
    var backIndicatorView: UIView! { get }    
    var frontIndicatorView: UIView! { get }    
    var instructionLabel: UILabel! { get }    
    var cameraVisualizer: UIView! { get }    
    var previewImageView: UIImageView! { get }    
    var captureButton: UIButton! { get }    
    var usePictureButton: UIButton! { get }    
    var takeNewPictureButton: UIButton! { get }

    func displayConfirmationSheet(visibility: Visibility, animated: Bool)
    func setFocus(to focusElement: FocusIndicator, animated: Bool)
    func setUsePictureButtonTitle(to newTitle: String)
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**)  | `backButton`           | UIButton para fechar a tela. |
| (**2**)  | `closeButton`          | UIButton para fechar a tela. |
| (**3**)  | `frontIndicatorView`   | View que indica o momento de utilizar a frente do documento. |
| (**4**)  | `backIndicatorView`    | View que indica o momento de utilizar o verso do documento. |
| (**5**)  | `instructionLabel`     | Texto informativo com orientação da captura, é exibido por apenas alguns segundos. |
| (**6**)  | `cameraPreview`        | Nesta view será colocado o preview da câmera. |
| (**7**)  | `cameraVisualizer`     | View que determina onde o preview câmera será visível. |
| (**8**)  | `cameraMask`           | View que determina onde a camera não será visível. |
| (**9**)  | `captureButton`        | Botão para capturar foto. |
| (**10**) | `previewImageView`     | UIImageView onde será exibida a imagem capturada para o usuário confirmar se ficou boa. |
| (**11**) | `takeNewPictureButton` | Botão para que o usuário capture a foto novamente. |
| (**12**) | `usePictureButton`     | Botão para que o usuário confirme a foto capturada. |
|          | `displayConfirmationSheet(visibility:animated:)` | Método que indica quando a *view* de confirmação de imagem deve ou não ser mostrada, esse método possui dois parâmetros: <br/> - **visibility** que é um `enum` do tipo ``Visibility`` que indica o estado da *view* de confirmação;<br/> - **animated** que indica quando é recomendado que esse comportamento seja feito com animação. |
|          | `setFocus(to:animated:)` | Método que indica qual o indicador de face do documento deve estar em foco no momento, esse método possui dois parâmetros: <br/> - **to (*focusElement*)** que é um `enum` do tipo ``FocusIndicator`` que possui os valores de *frontIndicator* e *backIndicator* que representam a frente e o verso do documento respectivamente;<br/> - **animated** que indica quando é recomendado que esse comportamento seja feito com animação. |
|          | `setUsePictureButtonTitle(to:)` | Método responsável por atribuir um novo titlulo para o botão de usar foto (`usePictureButton`). |

<br/>
<div>
    <img src="../Images/Documentscopy/dc_camera_1.png" width="432" height="396" />
    <img src="../Images/Documentscopy/dc_camera_2.png" width="432" height="396" />
</div>
    
**CameraPreviewView**

É uma classe customizada que herda de uma `UIView`.

<br/>

**Visibility**

```swift
public enum Visibility {
    case displayed
    case hidden
}
```

<br/>

**FocusIndicator**

```swift
public enum FocusIndicator {
    case front
    case back
}
```

---
    
## 3. Tela de processamento do documento
    
### `customLoadingView`

Essa view deve estar em conformidade com o tipo ``DocumentscopyCustomLoadingView`` que é um ``typealias`` para o tipo ``UIView``

<br/>
<img src="../Images/Documentscopy/dc_loading.png" width="432" height="396" />

---

## 4. Tela de resultado do processamento
    
### `customResultView`

Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomResultView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomResultView: UIView {
    var resultButton: UIButton! { get }
    
    func display(for resultType: DocumentscopyResultType)
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `resultButton` | Botão que indicará qual a próxima ação na tela de resultados. |
|         | `display(for:)` | Esse método recebe como parâmetro um `enum` do tipo `DocumentscopyResultType` que indica qual resultado deve ser mostrado. |

<br/>

| **Tipo de resultado** | **Exemplo de tela** |
|:----------------------|:--------------------|
| Sucesso | <img src="../Images/Documentscopy/dc_result_success.png" width="432" height="396" /> |
| Tente Novamente | <img src="../Images/Documentscopy/dc_result_tryagain.png" width="432" height="396" /> |
| Erro | <img src="../Images/Documentscopy/dc_result_error.png" width="432" height="396" /> |

**DocumentscopyResultType**

```swift
public enum DocumentscopyResultType {
    case success
    case tryAgain
    case error(DocumentscopyError)
}
```   
---
    
## 5. Tela de permissão da câmera

### `customCameraPermissionView`

Essa view deve estar em conformidade com o protocolo ``CustomCameraPermissionView`` que contém os seguintes atributos:

```swift
public protocol CustomCameraPermissionView: UIView {
    var backButton: UIButton! { get }
    var checkPermissionButton: UIButton! { get }
    var openSettingsButton: UIButton! { get }
    var closeButton: UIButton! { get }
    
    func showBottomSheet(visibility: Visibility)
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `backButton`            | Botão para função voltar da navegação. |
| (**2**) | `checkPermissionButton` | Botão responsável por verificar a permissão de câmera e solicitá-la se necessário. |
| (**3**) | `openSettingsButton`    | Botão que redireciona o usuário para o menu de permissões do aplicativo na configurações do dispositivo. |
| (**4**) | `closeButton`           | Botão que fecha o fluxo de validação da permissão de câmera e volta para tela anterior. |
|         | `showBottomSheet(visibility:)` | Método responsável por indicar o momento de mostrar os botões de ``openSettingsButton`` e ``closeButton``, podendo receber dois valores:<br/>- **hidden** (_esconder os botões_)<br/>- **displayed** (_mostrar os botões_) |

<br/>
<div>
    <img src="../Images/camera_permission_1.png" width="432" height="396" />
    <img src="../Images/camera_permission_2.png" width="432" height="396" />
</div>
