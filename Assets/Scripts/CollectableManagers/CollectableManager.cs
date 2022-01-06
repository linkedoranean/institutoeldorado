using UnityEngine;

public class CollectableManager : MonoBehaviour
{
    public CollectableClass _collectableClass = new CollectableClass();

    void Start()
    {
        _collectableClass.collectableMesh = GetComponent<MeshRenderer>();
        _collectableClass.collectableBC = GetComponent<BoxCollider>();
    }

    public void OnSelect()
    {
        _collectableClass.collectableBC.enabled = false;
        _collectableClass.collectableMesh.enabled = false;
        _collectableClass.relatedButton.GetComponent<AddItem>().OnAddItem();
    }

    public void OnDiscard()
    {
        _collectableClass.collectableBC.enabled = true;
        _collectableClass.collectableMesh.enabled = true;   
    }

    public void OnHighlight()
    {
        _collectableClass.collectableMesh.material = _collectableClass.selected;
    }

    public void OnUnhighlight()
    {
        _collectableClass.collectableMesh.material = _collectableClass.unselected;
    }
}