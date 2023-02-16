# Guia de customização - Documentoscopia 
Saiba como implementar a customização de views (telas), conforme a sua necessidade.

Você pode utilizar o SDK padrão e por meio dele, também customizar a visualização dessas telas.

## Configuração das telas customizáveis

A customização das telas é semelhante ao **Liveness**. Ela é feita por meio da criação de objetos do tipo **UIViews**(via código ou via Interface Builder), que implementem os protocolos definidos para cada tela.

Além das subviews especificadas, a view customizada pode conter outros elementos, apenas tomando cuidado para que os mesmos não interfiram nas subviews funcionais.

Para realizar essa implementação é necessário seguir alguns protocolos, para o funcionamento correto do processo de **documentoscopia**. 
Veja a seguir:

### Implementação

Todas as *views* customizadas são passadas via construtor da classe ``DocumentscopyViewController``. Essas *views* são opcionais, logo não há necessidade de especificar todas, caso não seja necessário.

```swift
let controller = DocumentscopyViewController(
    appKey: appKey, baseURL: baseURL, delegate: self,
    customInstructionView: CustomInstructionView(),
    customCameraPermissionView: CustomCameraPermissionView(),
    customView: CustomView(),
    customLoadingView: CustomLoadingView(),
    customResultView: CustomResultView()
)

```
**Caso qualquer um seja `nil`, será usado o *layout* padrão.**

## 1. Tela inicial

### `customInstructionView`
Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomInstructionView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomInstructionView: UIView {
    var backButton: UIButton! { get }
    var viewCNH: UIView! { get }
    var viewRG: UIView! { get }
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `backButton` | Botão para função voltar da navegação. |
| (**2**) | `viewCNH` | View que terá a ação de iniciar o fluxo de captura do documento CNH. |
| (**3**) | `viewRG` | View que terá a ação de iniciar o fluxo de captura do documento RG. |

<br/>
<img src="Images/dc_instructions.png" width="432" height="396" />

---

## 2. Tela de captura do documento

### `customView`
Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomView: UIView {
    var cameraPreview: DocumentscopyCameraPreviewView! { get }    
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

    func displayConfirmationSheet(visibility: DocumentscopyConfirmationSheetVisibility, animated: Bool)
    func setFocus(to focusElement: DocumentscopyFocusIndicator, animated: Bool)
    func setUsePictureButtonTitle(to newTitle: String)
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `backButton` | UIButton para fechar a tela. |
| (**2**) | `closeButton` | UIButton para fechar a tela. |
| (**3**) | `frontIndicatorView` | View que indica o momento de utilizar a frente do documento. |
| (**4**) | `backIndicatorView` | View que indica o momento de utilizar o verso do documento. |
| (**5**) | `instructionLabel` | Texto informativo com orientação da captura, é exibido por apenas alguns segundos. |
| (**6**) | `cameraPreview` | Nesta view será colocado o preview da câmera. |
| (**7**) | `cameraVisualizer` | View que determina onde o preview câmera será visível. |
| (**8**) | `cameraMask` | View que determina onde a camera não será visível. |
| (**9**) | `captureButton` | Botão para capturar foto. |
| (**10**) | `previewImageView` | UIImageView onde será exibida a imagem capturada para o usuário confirmar se ficou boa. |
| (**11**) | `takeNewPictureButton` | Botão para que o usuário capture a foto novamente. |
| (**12**) | `usePictureButton` | Botão para que o usuário confirme a foto capturada. |
|          | `displayConfirmationSheet(visibility:animated:)` | Método que indica quando a *view* de confirmação de imagem deve ou não ser mostrada, esse método possui dois parâmetros: <br/> - **visibility** que é um `enum` do tipo ``DocumentscopyConfirmationSheetVisibility`` que indica o estado da *view* de confirmação;<br/> - **animated** que indica quando é recomendado que esse comportamento seja feito com animação. |
|          | `setFocus(to:animated:)` | Método que indica qual o indicador de face do documento deve estar em foco no momento, esse método possui dois parâmetros: <br/> - **to (*focusElement*)** que é um `enum` do tipo ``DocumentscopyFocusIndicator`` que possui os valores de *frontIndicator* e *backIndicator* que representam a frente e o verso do documento respectivamente;<br/> - **animated** que indica quando é recomendado que esse comportamento seja feito com animação. |
|          | `setUsePictureButtonTitle(to:)` | Método responsável por atribuir um novo titlulo para o botão de usar foto (`usePictureButton`). |

<br/>
<div>
    <img src="Images/dc_camera_1.png" width="432" height="396" />
    <img src="Images/dc_camera_3.png" width="432" height="396" />
<div/>
    
**DocumentscopyCameraPreviewView**

É uma classe customizada que herda de uma `UIView`.

<br/>

**DocumentscopyConfirmationSheetVisibility**

```swift
public enum DocumentscopyConfirmationSheetVisibility {
    case displayed
    case hidden
}
```

<br/>

**DocumentscopyFocusIndicator**

```swift
public enum DocumentscopyFocusIndicator {
    case frontIndicator
    case backIndicator
}
```

---
    
## 3. Tela de processamento do documento
    
### `customLoadingView`

Essa view deve estar em conformidade com o tipo ``DocumentscopyCustomLoadingView`` que é um ``typealias`` para o tipo ``UIView``

<br/>
<img src="Images/fc_process_result.png" width="432" height="396" />

---

## 4. Tela de Resultado do Processamento
    
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
| (**1**) | `resultButton` | Botão para fechar o fluxo de reconhecimento de documento. |
|         | `display(for:)` | Esse método recebe como parâmetro um `enum` do tipo `DocumentscopyResultType` que indica qual resultado deve ser mostrado. |

<br/>

| **Tipo de resultado** | **Exemplo de tela** |
|:----------------------|:--------------------|
| Sucesso | <img src="Images/dc_result_success.png" width="432" height="396" /> |
| Tente Novamente | <img src="Images/dc_result_tryagain.png" width="432" height="396" /> |
| Erro | <img src="Images/dc_result_error.png" width="432" height="396" /> |

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

Essa view deve estar em conformidade com o protocolo ``DocumentscopyCustomCameraPermissionView`` que contém os seguintes atributos:

```swift
public protocol DocumentscopyCustomCameraPermissionView: UIView {
    var backButton: UIButton! { get }
    var checkPermissionButton: UIButton! { get }
    var openSettingsButton: UIButton! { get }
    var closeButton: UIButton! { get }
    
    func showBottomSheet(visibility: Visibility)
}
```

| **Indice** | **Elemento** | **Descrição** |
|:-----------|:-------------|:--------------|
| (**1**) | `backButton` | Botão para função voltar da navegação. |
| (**2**) | `checkPermissionButton` | Botão responsável por verificar a permissão de câmera e solicitá-la se necessário. |
| (**3**) | `openSettingsButton` | Botão que redireciona o usuário para o menu de permissões do aplicativo na configurações do dispositivo. |
| (**4**) | `closeButton` | Botão que fecha o fluxo de validação da permissão de câmera e volta para tela anterior. |
|         | `showBottomSheet(visibility:)` | Método responsável por indicar o momento de mostrar os botões de ``openSettingsButton`` e ``closeButton``, podendo receber dois valores: **hidden** (esconder os botões) e **displayed** (mostrar os botões). |

<br/>
<div>
    <img src="Images/camera_permission_1.png" width="432" height="396" />
    <img src="Images/camera_permission_2.png" width="432" height="396" />
<div/>

---
    
## Observações

No projeto Sample, neste mesmo repositório, encontra-se um exemplo de implementação. Recomenda-se usar como ponto de partida as views inclusas neste sample, modificando-as de acordo com a necessidade.
