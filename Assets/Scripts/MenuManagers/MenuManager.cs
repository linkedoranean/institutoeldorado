using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class MenuManager : MonoBehaviour
{
    public bool pause;

    [SerializeField] private CanvasGroup canvasAlpha;
    
    void Start()
    {
        
    }

    void Update()
    {
        if (Input.GetKeyDown(KeyCode.Escape))
        {
            Pause();
        }
    }

    public void Pause()
    {
        if (!pause)
        {
            canvasAlpha.alpha = 1;
            Cursor.lockState = CursorLockMode.None;
        }
        else
        {
            canvasAlpha.alpha = 0;
            Cursor.lockState = CursorLockMode.Locked;
        }
            
        pause = !pause;
    }
}
