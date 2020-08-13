using System;
using Xamarin.Forms;

namespace xamarin.forms_project
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();

        }

        async void OnButtonClicked(object sender, EventArgs args)
        {
            var result = await DisplayAlert("AlertDialog", "アラートダイアログです。YesかNoを選択してください。", "Yes", "No");
            label.Text = (result) ? "Yes" : "No";
        }
    }
}
