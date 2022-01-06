using UnityEngine;

public class SelectionManager : MonoBehaviour
{
    public delegate void MouseAction();
    public static event MouseAction OnSelected;
    public static event MouseAction OnDiscarded;

    private void Start()
    {
        
    }

    public void OnSelect()
    {
        OnSelected?.Invoke();
    }
    
    public void OnDiscard()
    {
        OnDiscarded?.Invoke();
    }
}