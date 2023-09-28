using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class ButtonController : MonoBehaviour
{

    public GameObject ShopUI;

    public GameObject WeaponSelectionUI;
    // Start is called before the first frame update
    void Start()
    {
        
    }

    // Update is called once per frame
    void Update()
    {
        
    }

    public void inShop()
    {
        ShopUI.SetActive(true);
    }

    public void outShop()
    {
        ShopUI .SetActive(false);

    }

       public void inWeaponSelect()
    {
        WeaponSelectionUI.SetActive(true);
    }

    public void outWeaponSelect()
    {
        WeaponSelectionUI .SetActive(false);

    }
}
