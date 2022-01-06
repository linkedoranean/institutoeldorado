using UnityEngine;

public class MouseManager : MonoBehaviour
{
    private float mouseX;
    private float mouseY;
    private float xRotation = 0f; //Variável utilizada para limitar a rotação no eixo X
    //dessa forma o jogador não olhará 360 quando mover o mouse para cima e para baixo

    [SerializeField] private float mouseSensitivity; //200f
    
    [SerializeField] private Transform playerBody;
    
    void Start()
    {
        playerBody = transform.parent.GetComponent<Transform>();
        
        //Para esconder o moouse e bloquear no centro da tela quando mover
        Cursor.lockState = CursorLockMode.Locked;
    }

    void Update()
    {
        mouseX = Input.GetAxis("Mouse X") * mouseSensitivity * Time.deltaTime;
        mouseY = Input.GetAxis("Mouse Y") * mouseSensitivity * Time.deltaTime;

        xRotation -= mouseY; //Se incrementar o valor aqui o eixo vertical fica invertido
        xRotation = Mathf.Clamp(xRotation, -90f, 90f);//Limitando para o jogador não olhar 360º na vertical
        
        transform.localRotation = Quaternion.Euler(xRotation, 0f, 0f);
        playerBody.Rotate(Vector3.up * mouseX);
    }
}
