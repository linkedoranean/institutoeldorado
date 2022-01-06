using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class SelectRaycastManager : MonoBehaviour
{
    public float raySize;
    private int layerMask;
    RaycastHit hit;

    void Start()
    {
        layerMask = LayerMask.GetMask("Collectable");        
    }

    void Update()
    {
        if (Input.GetMouseButtonDown(0))
        {
            if (Physics.Raycast(transform.position, transform.TransformDirection(Vector3.forward), out hit, raySize, layerMask))
            {
                hit.transform.GetComponent<SelectionManager>().OnSelect();
#if UNITY_EDITOR
                Debug.DrawRay(transform.position, transform.TransformDirection(Vector3.forward) * hit.distance, Color.red);
                Debug.Log("Hidden");
#endif
            }
        }
    }
}
