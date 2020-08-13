import React from 'react';
import { StyleSheet, Button, Text, View } from 'react-native';
import { ConfirmDialog } from 'react-native-simple-dialogs';

export default class App extends React.Component {

  state = {
      dialogVisible: false,
      appText: ''
  }
  render() {
      return (
          <View style={{ flex: 1, justifyContent: 'center', alignItems: 'center' }}>
              <Text style={styles.textStyle}>{this.state.appText}</Text>
              <Button
                  title="ダイアログを開く"
                  style={styles.buttonStyle}
                  onPress={() => this.setState({ dialogVisible: true })}
              />
              <ConfirmDialog
                  title="AlertDialog"
                  message="アラートダイアログです。YesかNoを選択してください。"
                  visible={this.state.dialogVisible}
                  onTouchOutside={() => this.setState({ dialogVisible: false })}
                  positiveButton={{
                      title: 'Yes',
                      onPress: () => {
                          this.setState({ 
                            dialogVisible: false,
                            appText: 'Yes'
                          });
                      }
                  }}
                  negativeButton={{
                      title: 'No',
                      onPress: () => {
                        this.setState({
                          dialogVisible: false,
                          appText: 'No'
                        });
                      }
                  }}
              />
          </View>
      );
  }
}

const styles = StyleSheet.create({
    textStyle: {
        fontSize: 30,
    },
    buttonStyle: {
        height: 150,
        width: 400,
        borderColor: "#20232a",
        borderWidth: 10,
    }
  }); 