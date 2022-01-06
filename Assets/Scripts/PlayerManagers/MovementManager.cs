using UnityEngine;

public class MovementManager : MonoBehaviour
{
    private float x;
    private float z;
    [SerializeField] private float speed; //12f
    
    private Vector3 move;

    [SerializeField] private CharacterController charController;
    
    void Start()
    {
        charController = GetComponent<CharacterController>();
    }

    void Update()
    {
        x = Input.GetAxis("Horizontal");
        z = Input.GetAxis("Vertical");

        move = transform.right * x + transform.forward * z;

        charController.Move(move * speed * Time.deltaTime);
    }
}