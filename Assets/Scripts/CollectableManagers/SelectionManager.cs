using UnityEngine;

public class SelectionManager : MonoBehaviour
{
    private CollectableManager _collectableManager;
    
    private void Start()
    {
        _collectableManager = GetComponent<CollectableManager>();
    }

    public void OnSelect()
    {
        _collectableManager.OnSelect();
    }
    
    public void OnDiscard()
    {
        _collectableManager.OnDiscard();
    }
}