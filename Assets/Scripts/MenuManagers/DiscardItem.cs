using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class DiscardItem : MonoBehaviour
{
    private Image buttonImg;
    private TMP_Text childTxt;
    
    [SerializeField] private GameObject relatedItem;
    
    void Start()
    {
        buttonImg = GetComponent<Image>();
        childTxt = gameObject.transform.GetChild(0).GetComponent<TMP_Text>();
    }

    public void OnDiscardItem()
    {
        buttonImg.enabled = false;
        childTxt.enabled = false;
        
        relatedItem.GetComponent<CollectableManager>().OnDiscard();
    }
}
