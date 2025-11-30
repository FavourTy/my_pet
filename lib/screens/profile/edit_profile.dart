import 'package:flutter/material.dart';
import 'package:my_pet/utils/colors.dart';

class EditProfileDialog extends StatelessWidget {
  const EditProfileDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      insetPadding: const EdgeInsets.all(20),
      child: Container(
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Row(
                children: [
                  GestureDetector(onTap: ()=>Navigator.pop(context), child: const CircleAvatar(radius: 12, backgroundColor: AppColors.primaryYellow, child: Icon(Icons.close, size: 14, color: Colors.black54))),
                  const SizedBox(width: 10),
                  const Expanded(child: Text("Edit owner name and pet name", style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.black87))),
                ],
              ),
              const SizedBox(height: 20),
        
              // Edit Owner
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(width: 60, height: 60, decoration: BoxDecoration(border: Border.all(color: Colors.grey), borderRadius: BorderRadius.circular(10))),
                      Positioned(bottom: -5, right: -5, child: CircleAvatar(radius: 10, backgroundColor: AppColors.primaryYellow, child: const Text("edit", style: TextStyle(fontSize: 6))))
                    ],
                  ),
                  const SizedBox(width: 15),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Owner namexx", style: TextStyle(fontSize: 10, color: Colors.grey)),
                        Container(height: 1, color: Colors.grey[300])
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text("message", style: TextStyle(fontSize: 10, fontWeight: FontWeight.bold)),
                  const SizedBox(width: 10),
                  const Expanded(
                    child: Text("dummy text dummy text dummy text\ndummy text dummy text dummy text\ndummy text dummy text", style: TextStyle(fontSize: 10, color: Colors.grey)),
                  )
                ],
              ),
              const SizedBox(height: 10),
              const Divider(),
              const SizedBox(height: 10),
        
              // Edit Pets Loop
              _buildPetEditRow(),
              const SizedBox(height: 15),
              _buildPetEditRow(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildPetEditRow() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Container(width: 50, height: 50, decoration: BoxDecoration(color: Colors.grey[300], borderRadius: BorderRadius.circular(8))),
        const SizedBox(width: 15),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text("pet name  xxxx", style: TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold)),
              const SizedBox(height: 5),
              Container(height: 1, color: Colors.grey[300])
            ],
          ),
        )
      ],
    );
  }
}