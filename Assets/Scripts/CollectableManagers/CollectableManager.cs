using UnityEngine;

public class CollectableManager : MonoBehaviour
{
    public CollectableClass _collectableClass = new CollectableClass();

    private void Awake()
    {
        MaterialManager.OnHighlighted += OnHighlight;
        MaterialManager.OnUnhighlighted += OnUnhighlight;
        SelectionManager.OnSelected += OnSelect;
        SelectionManager.OnDiscarded += OnDiscard;
    }

    private void OnDestroy()
    {
        MaterialManager.OnHighlighted -= OnHighlight;
        MaterialManager.OnUnhighlighted -= OnUnhighlight;
        SelectionManager.OnSelected -= OnSelect;
        SelectionManager.OnDiscarded -= OnDiscard;
    }

    void Start()
    {
        _collectableClass.collectableMesh = GetComponent<MeshRenderer>();
        _collectableClass.collectableBC = GetComponent<BoxCollider>();
    }

    void OnSelect()
    {
        _collectableClass.collectableBC.enabled = false;
        _collectableClass.collectableMesh.enabled = false;
    }

    void OnDiscard()
    {
        _collectableClass.collectableBC.enabled = true;
        _collectableClass.collectableMesh.enabled = true;   
    }

    void OnHighlight()
    {
        _collectableClass.collectableMesh.material = _collectableClass.selected;
    }

    void OnUnhighlight()
    {
        _collectableClass.collectableMesh.material = _collectableClass.unselected;
    }
}