using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class HighlightRaycastManager : MonoBehaviour
{
    public float raySize;

    [SerializeField] private GameObject hittedObj;
    [SerializeField] private SpriteRenderer aim;
    [SerializeField] private Sprite[] aimIcons;

    private int layerMask;
    RaycastHit hit;

    void Start()
    {
        layerMask = LayerMask.GetMask("Collectable");        
    }

    void FixedUpdate()
    {
        if (Physics.Raycast(transform.position, transform.TransformDirection(Vector3.forward), out hit, raySize, layerMask))
        {
            hittedObj = hit.transform.gameObject;
            hittedObj.GetComponent<MaterialManager>().ChangeToHighlighted();
            aim.sprite = aimIcons[1];
            
#if UNITY_EDITOR
            Debug.DrawRay(transform.position, transform.TransformDirection(Vector3.forward) * hit.distance, Color.yellow);
            Debug.Log("Did Hit");
#endif
        }
        else
        {
            if (hittedObj != null)
            {
                aim.sprite = aimIcons[0];
                hittedObj.GetComponent<MaterialManager>().ChangeToUnhighlighted();
                hittedObj = null;
            }
            
#if UNITY_EDITOR
            Debug.DrawRay(transform.position, transform.TransformDirection(Vector3.forward) * raySize, Color.white);
            Debug.Log("Did not Hit");
#endif
        }
    }
}
