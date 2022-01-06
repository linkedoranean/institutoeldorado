using UnityEngine;

[System.Serializable]
public class CollectableClass
{
    public Material unselected;
    public Material selected;

    public MeshRenderer collectableMesh;

    public BoxCollider collectableBC;
}