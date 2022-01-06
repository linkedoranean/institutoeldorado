using UnityEngine;

public class MaterialManager : MonoBehaviour
{
    private CollectableManager _collectableManager;
    
    private void Start()
    {
        _collectableManager = GetComponent<CollectableManager>();
    }

    public void ChangeToHighlighted()
    {
        _collectableManager.OnHighlight();
    }
    
    public void ChangeToUnhighlighted()
    {
        _collectableManager.OnUnhighlight();
    }
}