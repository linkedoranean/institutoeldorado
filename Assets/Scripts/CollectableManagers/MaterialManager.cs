using UnityEngine;

public class MaterialManager : MonoBehaviour
{
    public delegate void RaycastAction();
    public static event RaycastAction OnHighlighted;
    public static event RaycastAction OnUnhighlighted;

    private void Start()
    {
        
    }

    public void ChangeToHighlighted()
    {
        OnHighlighted?.Invoke();
    }
    
    public void ChangeToUnhighlighted()
    {
        OnUnhighlighted?.Invoke();
    }
}