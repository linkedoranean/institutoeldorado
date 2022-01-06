using UnityEngine;
using TMPro;
using UnityEngine.UI;

public class AddItem : MonoBehaviour
{
    private Image buttonImg;
    private TMP_Text childTxt;

    void Start()
    {
        buttonImg = GetComponent<Image>();
        childTxt = gameObject.transform.GetChild(0).GetComponent<TMP_Text>();
    }

    public void OnAddItem()
    {
        buttonImg.enabled = true;
        childTxt.enabled = true;
    }
}