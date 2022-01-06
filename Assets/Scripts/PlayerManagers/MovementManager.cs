using UnityEngine;

public class MovementManager : MonoBehaviour
{
    private float x;
    private float z;
    [SerializeField] private float speed; //12f
    
    private Vector3 move;

    [SerializeField] private CharacterController charController;
    [SerializeField] private MenuManager menuManager;
    
    void Start()
    {
        charController = GetComponent<CharacterController>();
    }

    void Update()
    {
        if (!menuManager.pause)
        {
            x = Input.GetAxis("Horizontal");
            z = Input.GetAxis("Vertical");

            move = transform.right * x + transform.forward * z;

            charController.Move(move * speed * Time.deltaTime);
        }
    }
}